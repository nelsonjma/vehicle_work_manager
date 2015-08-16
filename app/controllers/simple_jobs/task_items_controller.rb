module SimpleJobs
  class TaskItemsController < ApplicationController

    before_action :authenticated

    before_action :set_current_task, only: [:index, :new]
    before_action :set_task_item,         only: [:edit, :update, :destroy]

    include TaskItemsHelper

    def index
      @task_items = SimpleTaskItem.current_task_items(@task_id)
                        .select('simple_task_items.id, simple_task_items.stock_item_id,
                              simple_task_items.note, simple_task_items.qtd, users.name as user_name,
                              stock_items.code, stock_items.name as item_name, stock_items.price')
    end

    def new
      @stock_items = StockItem.search(params[:search])
                         .joins(:item_category)
                         .select('stock_items.*, item_categories.name as cat_name')

      @task_item    = SimpleTaskItem.new
    end

    def edit
      @stock_items      = StockItem.where('stock_items.id = ?', (params[:search]))
                              .joins(:item_category)
                              .select('stock_items.*, item_categories.name as cat_name')

      @stock_item_name  = @stock_items.first.name
    end

    def create
      @task_item = SimpleTaskItem.new(task_item_params)

      respond_to do |format|
        if @task_item.save
          remove_from_stock(@task_item.stock_item_id, @task_item.qtd)

          @stock_item = StockItem.find(@task_item.stock_item_id)

          format.js   {}
        else
          generic_form_error_hander(format, 'Erro ao adicionar item', @task_item.errors.full_messages)
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
          generic_form_error_hander(format, 'Erro ao actualizar item', @task_item.errors.full_messages)
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
      @task_item = SimpleTaskItem.find(params[:id])
    end

    def set_current_task
      @task_id = params[:task_id]
    end

    def task_item_params
      params.require(:simple_task_item).permit(:simple_task_id, :user_id, :stock_item_id, :note, :qtd)
    end

  end
end