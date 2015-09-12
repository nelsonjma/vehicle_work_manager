class VehicleTypesController < ApplicationController

  before_action :authenticated

  before_action :set_vehicle_type, only: [:edit, :update, :destroy]

  def index
    @vehicle_types = VehicleType.all
  end

  def new
    @vehicle_type = VehicleType.new
  end

  def edit
  end

  def create
    @vehicle_type = VehicleType.new(vehicle_type_params)

    respond_to do |format|
      if @vehicle_type.save
        format.html { redirect_to vehicle_types_path, notice: 'Tipo de veiculo criado com sucesso.' }
      else
        generic_form_error_hander(format, 'Erro ao criar tipo de veiculo', @vehicle_type.errors.full_messages)
      end
    end
  end

  def update
    respond_to do |format|
      if @vehicle_type.update(vehicle_type_params)
        format.html { redirect_to vehicle_types_path, notice: 'Tipo de veiculo actualizado com sucesso.' }
      else
        generic_form_error_hander(format, 'Erro ao actualizar tipo de veiculo', @vehicle_type.errors.full_messages)
      end
    end
  end

  def destroy
    respond_to do |format|
      if @vehicle_type.vehicles.count == 0
        @vehicle_type.destroy

        format.js   {  }
      else
        generic_form_error_hander(format, 'Erro ao eliminar tipo de veiculo', ['O tipo de veiculo tem veiculos, não pode ser eliminado.'])
      end
    end
  end

  private

    def set_vehicle_type
      @vehicle_type = VehicleType.find(params[:id])
    end

    def vehicle_type_params
      params.require(:vehicle_type).permit(:name, :upload)
    end
end
