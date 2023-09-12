class ParkingTransaction < ApplicationRecord
  belongs_to :parking_slot
  belongs_to :vehicle
  after_create :update_slot
  after_update :update_slot

  enum :status, [ :paid, :unpaid]


  def update_slot
     status = if self.parking_slot.status == ParkingSlot::STATUS_OCCUPIED && !self.time_out.nil?
                ParkingSlot::STATUS_VACANT
              else
                ParkingSlot::STATUS_OCCUPIED
              end
    self.parking_slot.update(status: status)
  end

end


