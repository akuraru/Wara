# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'wara/version'

Gem::Specification.new do |spec|
  spec.name          = "wara"
  spec.version       = Wara::VERSION
  spec.authors       = ["akuraru"]
  spec.email         = ["akuraru@gmail.com"]
  spec.summary       = %q{This generate a scapegoat for objects of CoreData.}
  spec.description   = %q{Wara generate a scapegoat for objects of CoreData.

You are using CoreDate, if you want to change the Entity, it is necessary to create a sub-context.However, it takes time be used to manage the sub-context.On the other hand, it is necessary to undo to the default context if one context.

Wara is used to generate an object to make changes without the operation of the context if you want to change the entity.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "thor", "~> 0.18.1"
  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.0"
end
