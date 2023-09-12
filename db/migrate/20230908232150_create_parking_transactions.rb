class CreateParkingTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :parking_transactions do |t|
      t.datetime :time_in
      t.datetime :time_out
      t.integer :exceeding_rate
      t.integer :exceeding_hour
      t.integer :initial_rate
      t.integer :initial_hour
      t.integer :total_rate
      t.integer :total_hour
      t.integer :status
      t.belongs_to :vehicle, index: true, foreign_key: true
      t.belongs_to :parking_slot, index: true, foreign_key: true
      t.timestamps
    end
  end
end
