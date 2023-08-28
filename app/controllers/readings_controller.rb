require 'sinatra'
require 'redcarpet'
require_relative '../services/readings_service'

class ReadingsController < Sinatra::Base
  set :show_exceptions, false

  before do
    content_type :json
  end

  # get '/' do
  #   markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
  #   content_type :html
  #   markdown.render(File.read('README.md'))
  # end


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

  get '/devices/:id' do |id|
    begin 
      status 200
      counts = ReadingsService.device_counts(id)
      { device_count: counts }.to_json
    rescue => e
      status
      { error: e.message }.to_json
    end 

  end 
end

