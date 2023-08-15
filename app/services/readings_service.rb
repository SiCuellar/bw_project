class ReadingsService
    @storage = {}
    
    class << self
      
      def store_readings(payload)
        device_id = payload["id"]
        readings = payload["readings"]
        
        raise "Device ID not provided" unless device_id
        raise "Readings not provided" unless readings.is_a?(Array)
        
        @storage[device_id] ||= []
        
        readings.each do |reading|
            timestamp = reading["timestamp"]
            count = reading["count"]
            
            raise "Invalid timestamp format" unless valid_timestamp?(timestamp)
            next unless count.is_a?(Integer)
        
            unless duplicate_reading?(device_id, timestamp, count)
                @storage[device_id] << { "timestamp" => timestamp, "count" => count }
            end
        end
          
        @storage[device_id].sort_by! { |reading| reading["timestamp"] }

        true
      rescue => e
        false
      end

      def fetch_readings(device_id)
        @storage[device_id]
      end
  
      private
  
      def duplicate_reading?(device_id, timestamp, count)
        @storage[device_id].any? do |existing_reading|
          existing_reading["timestamp"] == timestamp && existing_reading["count"] == count
        end
      end

      def valid_timestamp?(timestamp)
        return false unless timestamp.is_a?(String)
        # figure out how to verify ISO-8061 format
        true
      end
      
    end
end