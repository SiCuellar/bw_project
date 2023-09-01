class Reading < ActiveRecord::Base
    # validates :timestamps, presence: true, format: something 
    validates :count, numericality: { only_integer: true }
    belongs_to :device

end 