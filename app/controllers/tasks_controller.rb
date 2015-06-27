class TasksController < ApplicationController

  before_action :authenticated

  before_action :set_task, only: [:edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def create
    @task = Task.new(task_params)

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
        format.js {}
      else
        generic_form_error_hander(format, 'Erro ao actualizar tarefa', @task.errors.full_messages)
      end
    end
  end

  def destroy
    @task.destroy
    respond_to do |format|
      format.js { }
    end
  end

  private
    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:name, :description)
    end
end
