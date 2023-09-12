# app/views/vehicles/create.json.jbuilder


json.vehicle_detail do
  json.id @current_transaction.vehicle.id
  json.plate_number @current_transaction.vehicle.plate_number
  json.vehicle_type @current_transaction.vehicle.vehicle_type
end

json.parking_slot_transaction_details do
  json.id @current_transaction.id
  json.time_in @current_transaction.time_in
  json.flat_rate @current_transaction.initial_rate
  json.parking_slot "#{@current_transaction.parking_slot.row},#{@current_transaction.parking_slot.column}"
  json.parking_type @current_transaction.parking_slot.parking_type
  json.transaction_status @current_transaction.status
end

