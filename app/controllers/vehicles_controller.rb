class VehiclesController < ApplicationController

  before_action :load_parking_vehicle, only: [:create]
  before_action :load_vehicle, only: [:update]

  def index
    @vehicle = Vehicle.all

    respond_to do |format|
      format.json
    end
  end
  def create
    new_vehicle = Vehicle.new
    @current_transaction = new_vehicle.park(create_params, @parking)
    respond_to do |format|
      format.json
    end

  end
  def update
    @current_transaction = @vehicle.unpark
     respond_to do |format|
       format.json
     end
  end

  private

  def load_parking_vehicle

    vehicle_types = Vehicle::vehicle_types.keys
    parking_type = if create_params[:vehicle_type] == vehicle_types[0]
                     %w[small medium large]
                   elsif create_params[:vehicle_type] == vehicle_types[1]
                     %w[medium large]
                   elsif create_params[:vehicle_type] == vehicle_types[2]
                     %w[large]
                   end
    @parking = ParkingSlot.vacant_parking(create_params[:gate], [create_params[:vehicle_type]])
    if @parking.empty?
      @parking = ParkingSlot.vacant_parking( nil, parking_type)
    end
  end

  def load_vehicle
    @vehicle = Vehicle.find(params[:id])
  end

  def create_params
    params.require(:plate_number)
    params.require(:vehicle_type)
    params.require(:gate)
    params.permit(
    :plate_number,
    :vehicle_type,
    :gate
    )
  end
end
