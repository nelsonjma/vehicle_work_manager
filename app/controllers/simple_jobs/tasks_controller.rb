module SimpleJobs
  class TasksController < ApplicationController

    before_action :authenticated

    before_action :set_task, only: [:edit, :update, :destroy]
    before_action :set_current_work, only: [:index, :new]

    def index
      @tasks = SimpleTask.current_work_tasks(@work_id)
    end

    def new
    end

    def edit
    end

    def create
    end

    def update
    end

    def destroy
    end

    private

    def set_task
      @task = SimpleTask.find(params[:id])
    end

    def set_current_work
      @work_id = params[:work_id]
    end

    def task_params
      params.require(:simple_task).permit(:simple_work_id, :name, :description, :finished)
    end


  end
end