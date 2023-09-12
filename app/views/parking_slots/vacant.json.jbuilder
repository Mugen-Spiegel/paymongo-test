# app/views/parking_slot/vacant.json.jbuilder

json.parking_slot @parking_slot do |slot|
  json.id slot.id
  json.status slot.status
  json.slot "[#{slot.row}, #{slot.column}]"
  json.nearest_gate slot.gate
end
