class TaskItemsController < ApplicationController

  include TaskItemsHelper

  before_action :authenticated

  before_action :set_current_work_task, only: [:index, :new]
  before_action :set_task_item,         only: [:edit, :update, :destroy]

  def index
    @task_items = TaskItem.current_work_task_items(@work_task_id)
                      .select('task_items.id, task_items.stock_item_id,
                              task_items.note, task_items.qtd, users.name as user_name,
                              stock_items.code, stock_items.name as item_name')
  end

  def new
    @stock_items  = StockItem.search(params[:search])
    @task_item    = TaskItem.new
  end

  def edit
    @stock_items      = StockItem.search_by_id(params[:search])
    @stock_item_name  = @stock_items.first.name
  end

  def create
    @task_item = TaskItem.new(task_item_params)

    respond_to do |format|
      if @task_item.save
        remove_from_stock(@task_item.stock_item_id, @task_item.qtd)

        @stock_item = StockItem.find(@task_item.stock_item_id)

        format.js   {}
      else
        format.json { render json: @task_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    old_qtd = @task_item.qtd

    respond_to do |format|
      if @task_item.update(task_item_params)
        remove_from_stock(@task_item.stock_item_id, @task_item.qtd, old_qtd)

        @stock_item = StockItem.find(@task_item.stock_item_id)

        format.js   {}
      else
        format.json { render json: @task_item.errors, status: :unprocessable_entity }
        #format.js { render :js => "alert('error');" }
      end
    end
  end

  def destroy
    @task_item.destroy

    respond_to do |format|
      format.js   {}
    end
  end

  private

  def set_task_item
    @task_item = TaskItem.find(params[:id])
  end

  def set_current_work_task
    @work_task_id = params[:work_task_id]
  end

  def task_item_params
    params.require(:task_item).permit(:work_task_id, :user_id, :stock_item_id, :note, :qtd)
  end

end
