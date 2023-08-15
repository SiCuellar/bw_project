require 'sinatra'
require_relative '../services/readings_service'

class ReadingsController < Sinatra::Base
  set :show_exceptions, false

  before do
    content_type :json
  end

  post '/readings' do
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

  get '/readings/:id' do |id|
    begin
      readings = ReadingsService.fetch_readings(id)

      if readings
        status 200
        { readings: readings }.to_json
      else
        status 404
        { error: 'Device not found or has no readings' }.to_json
      end
    rescue => e
      status 400
      { error: e.message }.to_json
    end
  end
end
