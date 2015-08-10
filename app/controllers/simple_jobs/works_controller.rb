module SimpleJobs
  class WorksController < ApplicationController

    before_action :authenticated

    before_action :set_work, only: [:edit, :update, :destroy]

    include LayoutOperations::UserLayoutHelper

    def index
      if just_for_admin_user
        @work = SimpleWork.all
      else
        @work = SimpleWork.not_finished_work
      end
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

    def set_work
      @work = SimpleWork.find(params[:id])
    end

    def work_params
      params.require(:work).permit(:description, :notes, :finished)
    end

  end
end