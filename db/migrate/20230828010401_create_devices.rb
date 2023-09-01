class CreateDevices < ActiveRecord::Migration[7.0]
  def change
    create_table :devices do |t|
      t.string :device_id, null: false, unique: true
    end 
  end
end
