ENV['RACK_ENV'] = 'test'

require 'rspec'
require 'rack/test'
require 'pry'
require_relative '../app/controllers/readings_controller'
require_relative '../app/services/readings_service'

include Rack::Test::Methods

def app
  ReadingsController
end

RSpec.configure do |config|
  # maybe add setup/breakdown in the future? 
end
