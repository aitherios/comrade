#!/usr/bin/env gem build

require 'base64'
require File.expand_path('../lib/version', __FILE__)

Gem::Specification.new do |g|
  g.name = 'comrade'
  g.version = Comrade::VERSION
  g.author = 'Renan Mendes Carvalho'
  g.homepage = 'http://github.com/aitherios/comrade'
  g.summary = 'Comrade is a simple timer on top of dzen'
  g.description = 'Comrade is a simple timer on top of dzen'
  g.cert_chain = nil
  g.email = Base64.decode64 'YWl0aGVyaW9zQGdtYWlsLmNvbQ==\n'
  g.rubyforge_project = 'Comrade'
  
  g.files = `git ls-files`.split("\n")
  g.executables = Dir['bin/*'].map(&File.method(:basename))
  g.require_paths = ['lib']

  g.required_ruby_version = ::Gem::Requirement.new '> 1.8'
  g.add_development_dependency 'bundler', '~> 1.0'
end
