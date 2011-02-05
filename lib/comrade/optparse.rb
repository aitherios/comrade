# -*- encoding: utf-8 -*-

module Comrade
  require 'optparse'

  base_path = File.expand_path File.dirname(__FILE__)
  # Comrade version file
  require File.join(base_path, 'version')
  
  class Optparse
    def self.parse *args
      hash = {}
      OptionParser.new do |opts|
        opts.banner = 'Usage: comrade [options] [time]'

        opts.separator ''
        opts.separator 'Common options:'

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

      return hash
    end
  end
end
