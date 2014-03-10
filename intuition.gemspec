# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'intuition/version'

Gem::Specification.new do |gem|
  gem.name	        = 'intuition'
  gem.version	      = Intuition::VERSION
  gem.authors	      = ['Duncan Sample']
  gem.email	        = ['code@antimatters.co.uk']
  gem.summary       = %q{Integration module for The OWL heating and energy monitoring system.}
  gem.description   = %q{A gem for use when using and integrating with an OWL Intuition system. It aims to provide a core module for use in other Ruby projects, as well as some basic tools for using it.}
  gem.homepage      = 'https://github.com/dsample/intuition-gem'
  gem.license       = 'Apache2'

  gem.files         = `git ls-files -z`.split("\x0")
  gem.executables   = gem.files.grep(%r{^bin/}).map { |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^spec/})
  gem.require_paths = ['lib']

  gem.add_development_dependency 'bundler', '~> 1.5'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'guard', '>= 2.0.0'
  gem.add_development_dependency 'guard-rspec'
  gem.add_development_dependency 'webmock'
  gem.add_development_dependency 'simplecov'
  gem.add_development_dependency 'simplecov-gem-adapter'
  gem.add_development_dependency 'coveralls'
  gem.add_development_dependency 'rb-inotify', '>= 0.8.8'

  gem.add_runtime_dependency 'rake'
end
