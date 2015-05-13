# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gittop/version'

Gem::Specification.new do |spec|
  spec.name          = "gittop"
  spec.version       = Gittop::VERSION
  spec.authors       = ["salf"]
  spec.email         = ["nikola.symonov@gmail.com"]
  spec.summary       = "Gittop"
  spec.description   = "Tool to get users's git commits"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($\)
  spec.executables   = ['gittop']
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
end
