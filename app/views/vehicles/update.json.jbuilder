# app/views/vehicles/update.json.jbuilder


unless @current_transaction.kind_of? String
  json.vehicle_detail do
    json.id @current_transaction.vehicle.id
    json.plate_number @current_transaction.vehicle.plate_number
    json.vehicle_type @current_transaction.vehicle.vehicle_type
  end

  json.parking_slot_transaction_details do
    json.id @current_transaction.id
    json.parking_slot "#{@current_transaction.parking_slot.row},#{@current_transaction.parking_slot.column}"
    json.parking_type @current_transaction.parking_slot.parking_type
    json.time_in @current_transaction.time_in
    json.time_out   @current_transaction.time_out
    json.flat_rate @current_transaction.initial_rate
    json.initial_hour @current_transaction.initial_hour
    json.initial_rate @current_transaction.initial_rate
    json.exceeding_hour @current_transaction.exceeding_hour
    json.exceeding_rate @current_transaction.exceeding_rate
    json.total_hour @current_transaction.total_hour
    json.total_rate @current_transaction.total_rate
    json.transaction_status @current_transaction.status
  end
else
  json.message @current_transaction
end
