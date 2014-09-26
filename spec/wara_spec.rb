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
			core.create("./coredata/Model.xcdatamodeld/Model.xcdatamodel", out, lang)
		end
	end
	describe "creaet" do
		let(:out) { "./out/ObjC" }
		let(:lang) { Wara::Lang::ObjC }
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
		let(:dir) { "ObjC/" }
		let(:out) { "./out/#{dir}" }
		let(:input) { "./coredata/#{dir}" }
		let(:lang) { Wara::Lang::ObjC }
		include_context 'delete all file'
		include_context 'create'
		entity_names.each {|e|
			["_#{e}Wrapper.h", "_#{e}Wrapper.m", "#{e}Wrapper.h", "#{e}Wrapper.m"].each {|file_name|
				describe(file_name) {
					let(:read_interface) { File.read("#{out}#{file_name}")}
					let(:expected) { File.read("#{input}#{file_name}")}
					it(e) { expect(read_interface).to eq expected }
				}
			}
		}
	}
	describe(:objc) {
		let(:dir) { "Swift/" }
		let(:out) { "./out/#{dir}" }
		let(:input) { "./coredata/#{dir}" }
		let(:lang) { Wara::Lang::Swift }
		include_context 'delete all file'
		include_context 'create'
		entity_names.each {|e|
			["_#{e}Wrapper.swift", "#{e}Wrapper.swift"].each {|file_name|
				describe(file_name) {
					let(:read_interface) { File.read("#{out}#{file_name}")}
					let(:expected) { File.read("#{input}#{file_name}")}
					it(e) { expect(read_interface).to eq expected }
				}
			}
		}
	}
end
