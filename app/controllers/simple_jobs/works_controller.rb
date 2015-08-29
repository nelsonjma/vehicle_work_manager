module SimpleJobs
  class WorksController < ApplicationController

    before_action :authenticated

    before_action :set_work, only: [:edit, :update, :destroy]

    include LayoutOperations::UserLayoutHelper

    def index
      if just_for_admin_user
        @works = SimpleWork.all
      else
        @works = SimpleWork.not_finished_work
      end
    end

    def new
      @work = SimpleWork.new
    end

    def edit
    end

    def create
      @work = SimpleWork.new(work_params)

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
        if @work.simple_tasks.count == 0
          @work.destroy

          format.js   {  }
        else
          generic_form_error_hander(format, 'Erro ao eliminar obra', ['Obra tem tarefas, não pode ser eliminada.'])
        end
      end
    end

    private

    def set_work
      @work = SimpleWork.find(params[:id])
    end

    def work_params
      params.require(:simple_work).permit(:description, :notes, :finished, :start_work_at)
    end

  end
end