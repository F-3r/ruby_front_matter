# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruby_front_matter/version'

Gem::Specification.new do |spec|
  spec.name          = "ruby_front_matter"
  spec.version       = RubyFrontMatter::VERSION
  spec.authors       = ["F-3r"]
  spec.email         = ["f.fernando.martinez@gmail.com"]
  spec.description   = "simple & extensible front matter parsing for ruby"
  spec.summary       = spec.summary
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
