class ParkingSlot < ApplicationRecord

    has_many :parking_transactions

    STATUS_VACANT = "vacant"
    STATUS_OCCUPIED = "occupied"

    scope :vacant_parking, ->(gate, parking_type) {
        unless gate.nil?
            #get the vacant slot that has vehicle_type == parking_type and also that is closest to gate
            where(gate: gate, status: "vacant", parking_type: parking_type)
        else
            # get the vacant slot within the parking_type array
            where(status: "vacant", parking_type: parking_type)
        end
    }

    enum :parking_type, [:small, :medium, :large]

    enum :status, [ :vacant, :occupied]

end
