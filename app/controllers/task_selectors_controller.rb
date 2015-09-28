class TaskSelectorsController < ApplicationController

  before_action :authenticated

  def index
    @tasks = Task.search(params[:search])
  end

  def new
    @task = Task.new
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

  private
    def task_params
      params.require(:task).permit(:name, :description)
    end

end
