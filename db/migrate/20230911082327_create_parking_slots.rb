class CreateParkingSlots < ActiveRecord::Migration[7.0]
  def change
    create_table :parking_slots do |t|
      t.integer :status
      t.integer :row
      t.integer :column
      t.integer :gate
      t.integer :parking_type
      t.integer :price
      t.timestamps
    end
  end
end
