# -*- encoding: utf-8 -*-

require 'rubygems'
require 'bundler/version'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new

task :build do
  system 'gem build comrade.gemspec'
end

task :release => :build do
  system "gem push comrade-#{Comrade::VERSION}"
end
