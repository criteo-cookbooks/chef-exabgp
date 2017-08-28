require 'chefspec'
require 'chefspec/berkshelf'

# Include our libraries
Dir['libraries/*.rb'].each { |f| require File.expand_path(f) }
