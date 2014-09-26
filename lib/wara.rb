require "wara/version"
require 'kconv'
require 'fileutils'
require 'rexml/document'

module Wara
	module Lang 
		ObjC = 0
		Swift = 1
	end

	class Core
		def create(model, to, lang = Lang::ObjC)
			to = File.dirname(model) unless to
			@xml = REXML::Document.new(open(File.expand_path("contents", model)))
			@objects = @xml.get_elements('model/entity')
			@entities = @objects.map{ |o|
				representedClassName = o.attribute("representedClassName")
				parentEntity = o.attribute("parentEntity")
				a = o.get_elements("attribute")
				{
					"name" => o.attribute("name").value,
					"representedClassName"=>representedClassName ? representedClassName.value : nil,
					"parentEntity"=>parentEntity ? parentEntity.value : nil,
					"attributes"=>a.inject({}) {|s, o|
						s.merge({ o.attribute("name").value => o.attribute("attributeType").value, })
					},
				}
			}.select{|s| s["representedClassName"]}
			FileUtils.mkdir_p(to) unless FileTest.exist?(to)
			@entities.map {|e|
				file_name = e["representedClassName"]
				hw = header(e)
				File.write( File.expand_path("_#{file_name}Wrapper.h", to), hw)
				mw = implementation(e)
				File.write( File.expand_path("_#{file_name}Wrapper.m", to), mw)
				custom_header_name = File.expand_path("#{file_name}Wrapper.h", to)
				File.write( custom_header_name, custom_header(file_name)) unless FileTest.exist?(custom_header_name)
				custom_implementation_name = File.expand_path("#{file_name}Wrapper.m", to)
				File.write( custom_implementation_name, custom_implementation(file_name)) unless FileTest.exist?(custom_implementation_name)
			}
		end
		def header(e)
			name = e["representedClassName"]
			entity = e["parentEntity"]
			import = entity ? "\#import \"#{entity}Wrapper.h\"\n" : "#import <Foundation/Foundation.h>\n"
			parentEntity = entity ? "#{entity}Wrapper" : "NSObject"
			getter = entity ? "- (#{name} *)entity;\n" : "@property(readonly, strong, nonatomic) #{name} *entity;\n"
			"#{import}\n@class #{name};\n\n\n@interface _#{name}Wrapper : #{parentEntity}\n" +
			e["attributes"].map {|k, v|
				"@property(nonatomic, strong) #{entityType(v)}#{k};\n"
			}.inject("") {|s, v| s + v} + "\n#{getter}\n- (instancetype)initWithEntity:(#{name} *)entity;\n\n- (void)updateEntity:(#{name} *)entity;\n@end\n"
		end
		def implementation(e)
			name = e["representedClassName"]
			init = e["parentEntity"] ? "[super initWithEntity:entity]" : "[super init]"
			getter = e["parentEntity"] ? "- (BloodPressure *)entity {\n    return (BloodPressure *) [super entity];\n}\n\n" : ""
			first = e["parentEntity"] ? "" : "        _entity = entity;\n"
			update = e["parentEntity"] ? "    [super updateEntity:entity];\n" : ""
			"#import \"_#{name}Wrapper.h\"\n#import \"#{name}.h\"\n\n@interface _#{name}Wrapper ()\n@end\n\n@implementation _#{name}Wrapper {\n}\n#{getter}- (instancetype)initWithEntity:(#{name} *)entity {\n    self = #{init};\n    if (self) {\n#{first}" +
			e["attributes"].map {|k, v|
				" " * 8 + "self.#{k} = entity.#{k};\n"
			}.inject("") {|s, v| s + v} + "    }\n    return self;\n}\n\n- (void)updateEntity:(#{name} *)entity {\n#{update}" +
			e["attributes"].map {|k, v|
				" " * 4 + "entity.#{k} = self.#{k};\n"
			}.inject("") {|s, v| s + v} + "}\n@end\n"
		end
		def custom_header(file_name)
			"#import \"_#{file_name}Wrapper.h\"\n\n@interface #{file_name}Wrapper : _#{file_name}Wrapper {}\n// Custom logic goes here.\n@end\n"
		end
		def custom_implementation(file_name)
			"#import \"#{file_name}Wrapper.h\"\n\n\n@interface #{file_name}Wrapper ()\n\n// Private interface goes here.\n\n@end\n\n\n@implementation #{file_name}Wrapper\n\n// Custom logic goes here.\n\n@end\n"
		end
		def entityType(value)
			{
				"Boolean"=>"NSNumber *",
				"Binary"=>"NSData *",
				"Date"=>"NSDate *",
				"Decimal"=>"NSDecimalNumber *",
				"Double"=>"NSNumber *",
				"Float"=>"NSNumber *",
				"Integer 16"=>"NSNumber *",
				"Integer 32"=>"NSNumber *",
				"Integer 64"=>"NSNumber *",
				"String"=>"NSString *",
				"Transformable"=>"id ",
			}[value]
		end
	end
end
