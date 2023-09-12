class CreateVehicles < ActiveRecord::Migration[7.0]
  def change
    create_table :vehicles do |t|
      t.string :plate_number, index: { unique: true, name: 'unique_plate_number' }
      t.integer :vehicle_type
      t.timestamps
    end
  end
end
