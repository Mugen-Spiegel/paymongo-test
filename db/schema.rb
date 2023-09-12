# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_09_11_082327) do
  create_table "parking_slots", force: :cascade do |t|
    t.integer "status"
    t.integer "row"
    t.integer "column"
    t.integer "gate"
    t.integer "parking_type"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parking_transactions", force: :cascade do |t|
    t.datetime "time_in"
    t.datetime "time_out"
    t.integer "exceeding_rate"
    t.integer "exceeding_hour"
    t.integer "initial_rate"
    t.integer "initial_hour"
    t.integer "total_rate"
    t.integer "total_hour"
    t.integer "status"
    t.integer "vehicle_id"
    t.integer "parking_slot_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parking_slot_id"], name: "index_parking_transactions_on_parking_slot_id"
    t.index ["vehicle_id"], name: "index_parking_transactions_on_vehicle_id"
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "plate_number"
    t.integer "vehicle_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plate_number"], name: "unique_plate_number", unique: true
  end

  add_foreign_key "parking_transactions", "parking_slots"
  add_foreign_key "parking_transactions", "vehicles"
end
