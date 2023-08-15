require 'spec_helper'

describe ReadingsService do
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

  describe '.store_readings' do
    context 'with valid payload' do
      it 'stores the readings successfully' do
        expect(ReadingsService.store_readings(valid_device_data)).to be true
      end
    end

    context 'without device id' do
      before { valid_device_data["id"] = nil }

      it 'returns false' do
        expect(ReadingsService.store_readings(valid_device_data)).to be false
      end
    end

    context 'without readings' do
      before { valid_device_data["readings"] = nil }

      it 'returns false' do
        expect(ReadingsService.store_readings(valid_device_data)).to be false
      end
    end

    context 'with invalid reading format' do
      before { valid_device_data["readings"].first["timestamp"] = nil }

      it 'returns false' do
        expect(ReadingsService.store_readings(valid_device_data)).to be false
      end
    end
  end

  describe '.fetch_readings' do
    let(:device_id) { "36d5658a-6908-479e-887e-a949ec199275" }
  
    context 'when there are no readings stored for the device' do
      it 'returns nil' do
        expect(ReadingsService.fetch_readings(device_id)).to be_nil
      end
    end
  
    context 'when readings are stored for the device' do
      let(:readings) do
        [
          { "timestamp" => "2021-09-29T16:08:15+01:00", "count" => 2 },
          { "timestamp" => "2021-09-29T16:09:15+01:00", "count" => 15 }
        ]
      end
  
      before do
        payload = {
          "id" => device_id,
          "readings" => readings
        }
        ReadingsService.store_readings(payload)
      end
  
      it 'returns the readings for the device' do
        expect(ReadingsService.fetch_readings(device_id)).to eq(readings)
      end
    end
  end 
end
