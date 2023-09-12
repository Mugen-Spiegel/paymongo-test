class Vehicle < ApplicationRecord

  FLAT_RATE =  40
  INITIAL_HOUR = 3

  validates :plate_number, uniqueness: true

  has_many :parking_transactions
  enum :vehicle_type, [ :small, :medium, :large]

  scope :open_parking_transaction, ->(obj) { obj.parking_transactions.find_by(time_out: nil) }

  def park(params, parking)
    vehicle = Vehicle.find_or_create_by(plate_number: params[:plate_number]) do |vehicle|
      vehicle.vehicle_type = params[:vehicle_type]
    end
    time_out = unless vehicle&.parking_transactions&.last&.time_out.nil?
                ((Time.now - vehicle.parking_transactions.last.time_out.localtime) / 1.hour).to_int
               else
                 0
               end
    status = ParkingTransaction::statuses.keys
    if time_out == 0 && vehicle&.parking_transactions&.last.nil?
      #New vehicle without transaction
      ParkingTransaction.create(time_in:Time.now,vehicle_id: vehicle.id,parking_slot_id:
        parking.first.id,initial_rate: FLAT_RATE,initial_hour: INITIAL_HOUR, status: status[1])
    elsif time_out >= 1
      #vehicle that have transaction but the timeout exceeded the 1 hour grace period
      ParkingTransaction.create(time_in:Time.now,vehicle_id: vehicle.id,parking_slot_id:
        parking.first.id,initial_rate: FLAT_RATE,initial_hour: INITIAL_HOUR, status: status[1])
    else
      #update the last parking transaction that is still within the 1 hour grace period
      puts parking.first.id, "sadsdsadsas"
      vehicle.parking_transactions.last.update(
        time_out: nil,
        exceeding_hour: nil,
        exceeding_rate: nil,
        total_rate: nil,
        total_hour: nil,
        parking_slot_id: vehicle.parking_transactions.last.time_out == nil ? vehicle.parking_transactions.last.parking_slot_id : parking.first.id,
        status: status[1],
      )
      vehicle.parking_transactions.last
    end
  end

  def unpark

    current_transaction = parking_transactions.where(time_out: nil).first
    if current_transaction.nil?
      return "No open Transaction for this Vehicle"
    end

    total_hour = ((Time.now - current_transaction.time_in.localtime) / 1.hour).round
    if total_hour > 3 && total_hour < 24
      total_rate = current_transaction.initial_rate + (current_transaction.parking_slot.price * (total_hour - INITIAL_HOUR))
    elsif total_hour > 24
      total_days = total_hour / 24
      remaining_hour = (total_hour % 24)
      remaining_hour_rate = unless remaining_hour == 0
          current_transaction.parking_slot.price * (remaining_hour - INITIAL_HOUR)
      else
          0
      end
      # charge 5000 for every 24 hours
      total_rate = (total_days * 5000) + remaining_hour_rate
    else
      total_rate = current_transaction.initial_rate
    end

    total_hour_less_initial_hour = total_hour - 3

    exceeding_hour = if (total_hour_less_initial_hour < 0)
                       0
                     else
                       total_hour_less_initial_hour
                     end
    current_transaction.update(
      time_out: Time.now,
      exceeding_hour: exceeding_hour,
      exceeding_rate: (total_rate - current_transaction.initial_rate),
      total_rate: total_rate,
      total_hour: total_hour,
      status: ParkingTransaction::statuses.keys[0],
    )
    current_transaction
  end
end
