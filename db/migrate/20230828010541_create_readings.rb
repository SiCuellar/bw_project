class CreateReadings < ActiveRecord::Migration[7.0]
  def change
    create_table :readings do |t|
      t.string :timestamp, null: false
      t.integer :count, null: false
      t.references :device, foreign_key: true, null: false

      t.timestamps
    end
  end
end
