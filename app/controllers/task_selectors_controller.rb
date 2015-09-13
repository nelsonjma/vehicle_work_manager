class TaskSelectorsController < ApplicationController

  before_action :authenticated

  def index
    @tasks = Task.search(params[:search])
  end

end
