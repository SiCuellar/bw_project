require 'sinatra'
require_relative '../services/readings_service'

class ReadingsController < Sinatra::Base
  set :show_exceptions, false

  before do
    content_type :json
  end

  post '/readings' do
    binding.pry
    begin
      payload = JSON.parse(request.body.read)

      stored = ReadingsService.store_readings(payload)
      
      if stored
        status 200
        { message: 'Readings stored successfully' }.to_json
      else
        status 500
        { error: 'Failed to store readings' }.to_json
      end
    rescue => e
      status 400
      { error: e.message }.to_json
    end
  end

end
