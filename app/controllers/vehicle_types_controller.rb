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
        format.html { render :new }
        format.json { render json: @vehicle_type.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @vehicle_type.update(vehicle_type_params)
        format.html { redirect_to vehicle_types_path, notice: 'Tipo de veiculo actualizado com sucesso.' }
      else
        format.html { render :edit }
        format.json { render json: @vehicle_type.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @vehicle_type.destroy

    respond_to do |format|
      format.js   { }
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
