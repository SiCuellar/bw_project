require 'spec_helper'
require 'faker'

describe Device do
    context "validations" do 
        it "is valid with valid attributes" do
            device = Device.new(device_id: Faker::Internet.uuid)
            expect(device).to be_valid
        end 

        it "is not valid without device id" do
            device = Device.new(device_id: nil)
            expect(device).to_not be_valid
        end 

        it "responds to readings" do
            device = Device.new(device_id: Faker::Internet.uuid)
            expect(device).to respond_to(:readings)
        end
    end 
    
    describe "#duplicate_readings?" do
        it "returns true if reading with same timestamp and count exists" do
            device = Device.new(device_id: Faker::Internet.uuid)
            timestamp = Faker::Time.between(from: DateTime.now - 1, to: DateTime.now).iso8601
            Reading.create(device: device, timestamp: timestamp, count: 2)

            expect(device.duplicate_reading?(timestamp, 2)).to be true
        end
        
        it "returns false if reading with same timestamp but different count" do
            device = Device.new(device_id: Faker::Internet.uuid)
            timestamp = Faker::Time.between(from: DateTime.now - 1, to: DateTime.now).iso8601
            Reading.create(device: device, timestamp: timestamp, count: 2)

            expect(device.duplicate_reading?(timestamp, 10)).to be false
        end 

    end 
end

