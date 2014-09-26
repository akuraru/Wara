require 'spec_helper'
require './lib/wara'
require 'fileutils'

module Wara
	class Core
		attr_reader :xml, :objects, :entities
	end
end

describe Wara::Core, "load" do
	entity_names = ["BloodPressure", "HealthData", "CurrentPerson", "NotSame", "Person"]
	shared_context 'delete all file' do
		before do
			Dir["./out/ObjC/*.*"].each {|f|
				File.delete(f)
			}
			Dir["./out/Swift/*.*"].each {|f|
				File.delete(f)
			}
		end
	end
	shared_context 'create' do
		let(:core) {Wara::Core.new() }
		before do
			core.create("./coredata/Model.xcdatamodeld/Model.xcdatamodel", out=)
		end
	end
	describe "creaet" do
		let(:out) { "./out/ObjC" }
		include_context 'delete all file'
		include_context 'create'
		describe "xml" do
			let(:xml) { core.xml }
			it(:create) {
				expect(xml).not_to eq nil
			}
		end
		describe "objects" do
			let(:objects) {core.objects}
			it(:count_objects) {
				expect(objects.count).to eq 6
			}
		end
		describe "entities" do
			let(:entities) {core.entities}
			it(:count) {
				expect(entities.count).to eq 5
			}
			it(:has_name) {
				entities.map { |v|
					expect(v["name"]).not_to eq nil
				}
			}
			it(:check_frist) {
				expect(entities[0]).to eq(
					{
						"attributes" => {"bloodPressure"=>"Integer 32"},
						"name"=>"BloodPressure",
						"representedClassName"=>"BloodPressure",
						"parentEntity"=>"HealthData",
				} )
			}
			it(:check_second) {
				expect(entities[1]).to eq(
					{
						"attributes" => {},
						"name"=>"CurrentPerson",
						"representedClassName"=>"CurrentPerson",
						"parentEntity"=>nil,
				} )
			}
			it(:check_2) {
				expect(entities[2]).to eq(
					{
						"attributes" => {"height"=>"Integer 32", "timeStamp"=>"Date", "weight"=>"Integer 32"},
						"name"=>"HealthData",
						"representedClassName"=>"HealthData",
						"parentEntity"=>nil,
				} )
			}
			it(:check_3) {
				expect(entities[3]).to eq(
					{
						"attributes" => {"boolean"=>"Boolean", "data"=>"Binary", "date"=>"Date", "decimal"=>"Decimal", "double"=>"Double", "float"=>"Float", "int16"=>"Integer 16", "int32"=>"Integer 32", "int64"=>"Integer 64", "string"=>"String", "transformable"=>"Transformable"},
						"name"=>"NotSameCusstomClassName",
						"representedClassName"=>"NotSame",
						"parentEntity"=>nil,
				} )
			}
			it(:check_4) {
				expect(entities[4]).to eq(
					{
						"attributes" => {"birthday"=>"Date", "name"=>"String"},
						"name"=>"Person",
						"representedClassName"=>"Person",
						"parentEntity"=>nil,
				} )
			}
		end
	end
	describe(:objc) {
		let(:out) { "./out/ObjC" }
		include_context 'delete all file'
		include_context 'create'
		entity_names.each {|e|
			describe(:read_interface) {
				let(:read_interface) { File.read("out/ObjC/_#{e}Wrapper.h")}
				let(:expected) { File.read("coredata/ObjC/_#{e}Wrapper.h")}
				it(e) { expect(read_interface).to eq expected }
			}
		}
		entity_names.each {|e|
			describe(:read_implementation) {
				let(:read_implementation) { File.read("out/ObjC/_#{e}Wrapper.m")}
				let(:expected) { File.read("coredata/ObjC/_#{e}Wrapper.m")}
				it(e) { expect(read_implementation).to eq expected }
			}
		}
		entity_names.each {|e|
			describe(:read_interface_name) {
				let(:read_interface_name) { File.read("out/ObjC/#{e}Wrapper.h")}
				let(:expected) { File.read("coredata/ObjC/#{e}Wrapper.h")}
				it(e) { expect(read_interface_name).to eq expected }
			}
		}
		entity_names.each {|e|
			describe(:read_implementation_name) {
				let(:read_implementation_name) { File.read("out/ObjC/#{e}Wrapper.m")}
				let(:expected) { File.read("coredata/ObjC/#{e}Wrapper.m")}
				it(e) { expect(read_implementation_name).to eq expected }
			}
		}
	}
end
