# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
#

slots = []

(1...5).each do |row|
  (1...13).each do |column|
    slots << if column < 5
               {status: "vacant", gate: 1, row: row, column: column, parking_type: "small", price: 20}
             elsif column >= 5 and column < 9
               {status: "vacant", gate: 2, row: row, column: column, parking_type: "medium", price: 60}
             else
               {status: "vacant", gate: 3, row: row, column: column, parking_type: "large", price: 100}
             end
  end
end


ParkingSlot.insert_all(slots)
