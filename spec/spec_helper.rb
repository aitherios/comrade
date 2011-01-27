# requiring comrade module
base_path = File.expand_path File.dirname(__FILE__)
require File.join(base_path, '..', 'lib', 'comrade')
# requiring support directory
Dir[File.join base_path, 'support/**/*.rb'].each {|f| require f}
