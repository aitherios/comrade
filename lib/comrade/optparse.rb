# -*- encoding: utf-8 -*-

module Comrade
  require 'optparse'

  base_path = File.expand_path File.dirname(__FILE__)
  # Comrade version file
  require File.join(base_path, 'version')
  
  class Optparse
    def self.parse! args
      hash = {}
      OptionParser.new do |opts|
        opts.banner = 'Usage: comrade [options] [time]'

        opts.separator ''
        opts.separator 'Optional arguments:'

        hash[:color] = 'red'
        opts.on('-c', '--color COLOR', '--colour COLOR', String, 'Line color') do |color|
          hash[:color] = color.strip
        end

        hash[:background_color] = 'black'
        opts.on('-b', '--background COLOR', String, 'Line background color') do |color|
          hash[:background_color] = color.strip
        end

        hash[:size] = 1280
        opts.on('-s', '--size SIZE', Integer, 'Line size in pixels') do |size|
          hash[:size] = size
        end

        hash[:thickness] = 1
        opts.on('-t', '--thickness THICKNESS', Integer, 'Line thickness in pixels') do |thickness|
          hash[:thickness] = thickness
        end

        hash[:xposition] = 0
        opts.on('-x X', Integer, 'Screen position in the X axis') do |x|
          hash[:xposition] = x
        end

        hash[:yposition] = 0
        opts.on('-y Y', Integer, 'Screen position in the Y axis') do |y|
          hash[:yposition] = y
        end

        opts.separator ''
        opts.separator 'Common arguments:'

        hash[:exit] = false
        hash[:message] = ''

        opts.on_tail('-h', '--help', 'Show this message') do
          hash[:message] = opts.to_s
          hash[:exit] = true
        end

        opts.on_tail('--version', 'Show version') do
          hash[:message] = "comrade version #{Comrade::VERSION} \n\n" <<
                           "Copyright (C) 2010 Free Software Foundation, Inc.\n" <<
                           "License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>." <<
                           "This is free software: you are free to change and redistribute it." <<
                           "There is NO WARRANTY, to the extent permitted by law." <<
                           "Written by Renan Mendes Carvalho."
          hash[:exit] = true
        end
      end.parse! args

      hash[:timer] = args.join(' ') unless args.empty?

      hash
    end
  end
end
