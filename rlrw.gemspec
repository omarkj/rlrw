# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rlrw/version'

Gem::Specification.new do |spec|
  spec.name          = "rlrw"
  spec.version       = Rlrw::VERSION
  spec.authors       = ["omarkj"]
  spec.email         = ["omarkj@gmail.com"]
  spec.summary       = "Lowest Random Weight hashing"
  spec.description   = %q{This hashing mechanism allows you to consistently hash to a specific node without needing to do bucketing first a'la Consistent Hashing. It also guarantees as little key redistribution as possible.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]


  spec.add_runtime_dependency "murmurhash3", "= 0.1.4"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "= 5.4.3"
end
