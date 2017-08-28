require 'chefspec'
require 'chefspec/berkshelf'

RSpec.configure do |config|
  config.platform = 'ubuntu'
  config.version = '14.04'
end

# Include our libraries
Dir['libraries/*.rb'].each { |f| require File.expand_path(f) }
