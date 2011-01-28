# -*- encoding: utf-8 -*-

require 'fileutils'
require 'lib/version'
require 'rubygems'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new

desc 'Build gem'
task :build do
  system 'gem build comrade.gemspec'
  Dir.mkdir 'pkg' if Dir['pkg'].empty?
  FileUtils.mv gem_filename, 'pkg' if Dir['pkg']
end

desc 'Publish gem to RubyGems.org'
task :release => :build do
  system "gem push pkg/#{gem_filename}"
end

desc 'Install gem'
task :install => :build do
  system "gem install pkg/#{gem_filename}"
end

def gem_filename
  "comrade-#{Comrade::VERSION}.gem"
end
