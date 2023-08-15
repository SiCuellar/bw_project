require 'spec_helper'


describe 'ReadingsController' do

  describe 'POST /readings' do
    let(:valid_device_data) do
      {
        "id" => "36d5658a-6908-479e-887e-a949ec199272",
        "readings" => [
          {
            "timestamp" => "2021-09-29T16:08:15+01:00",
            "count" => 2
          },
          {
            "timestamp" => "2021-09-29T16:09:15+01:00",
            "count" => 15
          }
        ]
      }
    end

    it 'successfully stores device readings' do
      post '/readings', valid_device_data.to_json
      expect(last_response.status).to eq(200)
    end

  end
end
