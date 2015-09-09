class LaborUsersController < ApplicationController

  before_action :authenticated

  before_action :set_labor_user, only: [:destroy]

  def index
  end

  def new
  end

  def create
  end

  def destroy
  end

  private

  def set_labor_user
    @labor_user = LaborUser.find(params[:id])
  end

  def labor_user_params
    params.require(:labor_user).permit(:work_task_id, :user_id, :ut)
  end

end
