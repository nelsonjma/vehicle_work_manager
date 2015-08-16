module SimpleJobs
  class TasksController < ApplicationController

    before_action :authenticated

    before_action :set_task, only: [:edit, :update, :destroy, :finish]
    before_action :set_work_tasks, only: [:index, :new]

    def index
      @tasks = @work.simple_tasks.all
    end

    def new
      @task = @work.simple_tasks.new
    end

    def edit
    end

    def create
      @task = SimpleTask.new(task_params)

      respond_to do |format|
        if @task.save
          format.js   {}
        else
          generic_form_error_hander(format, 'Erro ao criar tarefa', @task.errors.full_messages)
        end
      end
    end

    def update
      respond_to do |format|
        if @task.update(task_params)

          format.js   {}
        else
          generic_form_error_hander(format, 'Erro ao actualizar tarefa', @task.errors.full_messages)
        end
      end
    end

    def destroy
      respond_to do |format|
        if @task.simple_task_items.count == 0
          @task.destroy

          format.js   {}
        else
          generic_form_error_hander(format, 'Erro ao eliminar tarefa', ['Tarefa tem items de stock, não pode ser eliminada.'])
        end
      end
    end

    def finish
      @task.finish

      respond_to do |format|
        format.js   {}
      end
    end

    private

    def set_task
      @task = SimpleTask.find(params[:id])
    end

    def set_work_tasks
      @work = SimpleWork.find(params[:work_id])
    end

    def task_params
      params.require(:simple_task).permit(:simple_work_id, :name, :description, :finished)
    end

  end
end