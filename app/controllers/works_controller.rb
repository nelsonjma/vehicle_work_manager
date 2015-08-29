class WorksController < ApplicationController

  before_action :authenticated

  before_action :set_vehicle_work, only: [:index, :new]
  before_action :set_work, only: [:edit, :update, :destroy]

  include LayoutOperations::UserLayoutHelper
  include VehicleWorkReport

  def index

    if just_for_admin_user
      @works = @vehicle.works.all
    else
      @works = @vehicle.works.not_finished_work

      # redirecto to tasks if just one work
      redirect_to work_tasks_url(params: { work_id: @works[0].id, vehicle_id: @vehicle.id, origin: 'from_vehicles' }) if @works.count == 1
    end
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

  def download_work_report
    vehicle_id  = params[:vehicle_id]
    work_id     = params[:work_id]

    respond_to do |format|
      format.xlsx { build_work_report(vehicle_id, work_id) }
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
    params.require(:work).permit(:description, :notes, :finished, :vehicle_id, :start_work_at)
  end

end
