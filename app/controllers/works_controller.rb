class WorksController < ApplicationController

  before_action :authenticated

  before_action :set_vehicle_work, only: [:index, :new]
  before_action :set_work, only: [:edit, :update, :destroy]

  def index
    @works = @vehicle.works.all
  end

  def new
    @work = @vehicle.works.new
  end

  def edit
  end

  def create
    @work = Work.new(work_params)

    respond_to do |format|
      if @work.save
        format.js   {}
      else
        generic_form_error_hander(format, 'Erro ao criar obra', @work.errors.full_messages)
      end
    end
  end

  def update
    respond_to do |format|
      if @work.update(work_params)
        format.js   {}
      else
        generic_form_error_hander(format, 'Erro ao actualizar obra', @work.errors.full_messages)
      end
    end
  end

  def destroy
    respond_to do |format|
      if @work.work_tasks.count == 0
        @work.destroy

        format.js   {  }
      else
        generic_form_error_hander(format, 'Erro ao eliminar obra', ['Obra tem tarefas, não pode ser eliminada.'])
      end
    end
  end

  private

  def set_vehicle_work
    @vehicle = Vehicle.find(params[:vehicle_id])
  end

  def set_work
    @work = Work.find(params[:id])
  end

  def work_params
    params.require(:work).permit(:description, :notes, :finished, :vehicle_id)
  end

end
