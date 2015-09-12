class LaborUsersController < ApplicationController

  before_action :authenticated

  before_action :set_labor_user, only: [:destroy]
  before_action :set_work_task_id, only: [:new]

  def index
  end

  def new
    @labor_user = LaborUser.new
  end

  def create
    @labor_user = LaborUser.new(labor_user_params)

    respond_to do |format|
      if @labor_user.save
        format.js   {}
      else
        generic_form_error_hander(format, 'Erro ao adicionar tarefa', @labor_user.errors.full_messages)
      end
    end
  end

  def destroy
  end

  private

  def set_labor_user
    @labor_user = LaborUser.find(params[:id])
  end

  def set_work_task_id
    @work_task_id = params[:work_task_id]
  end

  def labor_user_params
    params.require(:labor_user).permit(:work_task_id, :user_id, :ut)
  end

end
