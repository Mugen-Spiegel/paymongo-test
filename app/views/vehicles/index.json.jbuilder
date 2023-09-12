# app/views/vehicles/index.json.jbuilder


json.vehicle_detail @vehicle do |vehicle|
  json.id vehicle.id
  json.plate_number vehicle.plate_number
  json.vehicle_type vehicle.vehicle_type

  json.parking_slot_transactions vehicle.parking_transactions do |transaction|
    json.id transaction.id
    json.parking_slot "#{transaction.parking_slot.row},#{transaction.parking_slot.column}"
    json.parking_type transaction.parking_slot.parking_type
    json.time_in transaction.time_in
    json.time_out   transaction.time_out
    json.flat_rate transaction.initial_rate
    json.initial_hour transaction.initial_hour
    json.initial_rate transaction.initial_rate
    json.exceeding_hour transaction.exceeding_hour
    json.exceeding_rate transaction.exceeding_rate
    json.total_hour transaction.total_hour
    json.total_rate transaction.total_rate
    json.transaction_status transaction.status
  end

end


