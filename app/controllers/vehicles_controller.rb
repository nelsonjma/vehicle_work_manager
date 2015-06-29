class VehiclesController < ApplicationController

  before_action :authenticated

  before_action :set_vehicle, only: [:edit, :update, :destroy]

  include LayoutOperations::UserLayoutHelper

  def index

    if just_for_admin_user
      @vehicles = Vehicle
                      .joins(:vehicle_type)
                      .select('vehicles.id, vehicles.description, vehicle_types.name, vehicle_types.image')
    else
      @vehicles       = Vehicle
                            .with_work_not_finished
                            .joins(:vehicle_type)
                            .select('vehicles.id, vehicles.description, vehicle_types.name, vehicle_types.image')
    end

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
        generic_form_error_hander(format, 'Erro ao criar veiculo', @vehicle.errors.full_messages)
      end
    end
  end

  def update
    respond_to do |format|
      if @vehicle.update(vehicle_params)
        @vehicle_details  = VehicleType.find(@vehicle.vehicle_type_id)

        format.js   {}
      else
        generic_form_error_hander(format, 'Erro ao actualizar veiculo', @vehicle.errors.full_messages)
      end
    end
  end

  def destroy
    respond_to do |format|
      if @vehicle.works.count == 0
        @vehicle.destroy

        format.js   {  }
      else
        generic_form_error_hander(format, 'Erro ao eliminar veiculo', ['O veiculo tem obras, não pode ser eliminado.'])
      end
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
