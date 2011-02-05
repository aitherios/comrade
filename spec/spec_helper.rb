# -*- encoding: utf-8 -*-

base_path = File.expand_path File.dirname(__FILE__)
# comrade module
Dir[File.join base_path, '../lib/comrade/**/*.rb'].each { |f| require f }
# support directory
Dir[File.join base_path, 'support/**/*.rb'].each { |f| require f }
