class Device < ActiveRecord::Base
    has_many :readings

    validates :device_id, presence: true


    def duplicate_reading?(timestamp, count)
        readings.exists?(timestamp: timestamp, count: count)
    end
end 