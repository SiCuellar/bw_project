require 'faker'

10.times do 
    device = Device.create!(device_id: Faker::Internet.uuid)
    # for each device  we need a random number of readings
    rand(5..10).times do
        Reading.create!(
            device_id: device.id,
            timestamp: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
            count: rand(1..10)
        )
    end 
end 
    