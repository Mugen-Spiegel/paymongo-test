class ParkingSlotsController < ApplicationController

  def index
    @parking_slot = ParkingSlot.all
    respond_to do |format|
      format.json
    end
  end

  def occupied
    @parking_slot = ParkingSlot.where(status: ParkingSlot::STATUS_OCCUPIED)
    respond_to do |format|
      format.json
    end
  end

  def vacant
    @parking_slot = ParkingSlot.where(status: ParkingSlot::STATUS_VACANT)
    respond_to do |format|
      format.json
    end
  end
end
