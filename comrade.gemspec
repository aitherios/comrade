#!/usr/bin/env gem build
# -*- encoding: utf-8 -*-

require 'lib/version'

Gem::Specification.new do |g|
  g.name = 'comrade'
  g.version = Comrade::VERSION
  g.author = 'Renan Mendes Carvalho'
  g.email = 'aitherios@gmail.com'
  g.homepage = 'http://github.com/aitherios/comrade'
  g.summary = 'Simple visual timer on top of dzen2.'
  g.description = 'Comrade is a simple visual timer on top of dzen2.' << 
                  ' It draws a line on your screen that progressively shrinks when the time passes.'
  g.cert_chain = nil
  g.rubyforge_project = 'Comrade'

  g.files = `git ls-files`.split("\n")
  g.executables = Dir['bin/*'].map(&File.method(:basename))
  g.require_path = 'lib'

  g.required_ruby_version = ::Gem::Requirement.new '> 1.8'
  g.add_dependency 'treetop',                      '~> 1.4.9'
  g.add_dependency 'ruby-dzen',                    '~> 0.0.1'
  g.add_development_dependency 'bundler',          '~> 1.0'
  g.add_development_dependency 'rspec',            '~> 2.2'
  g.requirements << 'dzen2, tested with version 0.8.5, http://sites.google.com/site/gotmor/dzen'
end
