class WorkTasksController < ApplicationController

  before_action :authenticated

  before_action :set_work_task,     only: [:edit, :update, :destroy]
  before_action :set_current_work,  only: [:index, :new]

  def index
    @work_tasks = Work.current_work_tasks(@work_id)
                      .select('work_tasks.id, work_tasks.ut, tasks.name, tasks.description ')
  end

  def new
    @work_task = WorkTask.new
  end

  def edit
  end

  def create
    @work_task = WorkTask.new(work_task_params)

    respond_to do |format|
      if @work_task.save
        @task_details = Task.find(@work_task.task_id)
        @vehicle_id   = Work.find(@work_task.work_id).vehicle_id

        format.js   {}
      else
        generic_form_error_hander(format, 'Erro ao adicionar tarefa', @work_task.errors.full_messages)
      end
    end
  end

  def update
    respond_to do |format|
      if @work_task.update(work_task_params)
        @task_details = Task.find(@work_task.task_id)

        format.js   {}
      else
        generic_form_error_hander(format, 'Erro ao actualizar tarefa', @work_task.errors.full_messages)
      end
    end
  end

  def destroy
    respond_to do |format|
      if @work_task.task_items.count == 0
        @work_task.destroy

        format.js   {}
      else
        generic_form_error_hander(format, 'Erro ao eliminar tarefa', ['Tarefa tem items de stock, não pode ser eliminada.'])
      end
    end
  end

  private
  def set_work_task
    @work_task = WorkTask.find(params[:id])
  end

  def set_current_work
    @work_id = params[:work_id]
  end

  def work_task_params
    params.require(:work_task).permit(:work_id, :task_id, :ut)
  end

end
