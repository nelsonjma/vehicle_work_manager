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

        format.js   {}
      else
        format.json { render json: @work_task.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @work_task.update(work_task_params)
        @task_details = Task.find(@work_task.task_id)

        format.js   {}
      else
        format.json { render json: @work_task.errors, status: :unprocessable_entity }
        #format.js { render :js => "alert('error');" }
      end
    end
  end

  def destroy
    @work_task.destroy

    respond_to do |format|
      format.js   {}
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
