class VehiclesController < ApplicationController

  before_action :authenticated

  before_action :set_vehicle, only: [:edit, :update, :destroy]

  def index
=begin
    @vehicles       = Vehicle
                        .with_work_not_finished
                        .joins(:vehicle_type)
                        .select('vehicles.id, vehicles.description, vehicle_types.name, vehicle_types.image')
=end
    @vehicles = Vehicle
                      .joins(:vehicle_type)
                      .select('vehicles.id, vehicles.description, vehicle_types.name, vehicle_types.image')
  end

  def new
    @vehicle = Vehicle.new
  end

  def edit
  end

  def create
    @vehicle = Vehicle.new(vehicle_params)

    respond_to do |format|
      if @vehicle.save
        @vehicle_details  = VehicleType.find(@vehicle.vehicle_type_id)

        format.js   {}
      else
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @vehicle.update(vehicle_params)
        @vehicle_details  = VehicleType.find(@vehicle.vehicle_type_id)

        format.js   {}
      else
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @vehicle.destroy

    respond_to do |format|
      format.html { render :index, notice: 'Veiculo eliminado com sucesso.' }
      format.js   {  }
    end
  end

  private

    def set_vehicle
      @vehicle = Vehicle.find(params[:id])
    end

    def vehicle_params
      params.require(:vehicle).permit(:description, :vehicle_type_id)
    end

end
