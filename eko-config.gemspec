# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'eko-config/version'

Gem::Specification.new do |spec|
  spec.name          = 'eko-config'
  spec.version       = EkoConfig::VERSION
  spec.authors       = ['Trevor Strieber']
  spec.email         = ['trevor@strieber.org']
  spec.summary       = %q{Read Eko configuration files.}
  spec.license       = 'MIT'

  spec.files         = Dir['{lib,vendor}/**/*'] + ['LICENSE.txt', 'README.md']
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'
end
