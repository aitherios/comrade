#!/usr/bin/env gem build
# -*- encoding: utf-8 -*-

require 'lib/version'

Gem::Specification.new do |g|
  g.name = 'comrade'
  g.version = Comrade::VERSION
  g.author = 'Renan Mendes Carvalho'
  g.email = 'aitherios@gmail.com'
  g.homepage = 'http://github.com/aitherios/comrade'
  g.license = 'GPL-3'
  g.summary = 'Simple visual timer on top of dzen2.'
  g.description = 'Comrade is a simple visual timer on top of dzen2.' << 
                  ' It draws a line on your screen that progressively shrinks when the time passes.' <<
                  ' After that it notifies you when the time is over.'

  g.files = `git ls-files`.split("\n")
  g.test_files = Dir.glob('spec/**/*_spec.rb')
  g.executables = Dir['bin/*'].map(&File.method(:basename))

  g.required_ruby_version = ::Gem::Requirement.new '> 1.8'
  g.add_dependency 'treetop',                      '~> 1.4.9'
  g.add_dependency 'ruby-dzen',                    '~> 0.0.1'
  g.add_dependency 'notifier',                     '~> 0.1.2'
  g.add_development_dependency 'bundler',          '~> 1.0'
  g.add_development_dependency 'rspec',            '~> 2.2'
  g.requirements << 'dzen2, tested with version 0.8.5, http://sites.google.com/site/gotmor/dzen'
end
