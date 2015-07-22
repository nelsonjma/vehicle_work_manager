class StockItemsController < ApplicationController

  helper 'table_operations/sorting'

  include TableOperations::SortingHelper

  before_action :authenticated

  before_action :set_stock_item, only: [:edit, :update, :destroy]

  def index
    sort      = sort_column(:sort, :created_at)
    direction = sort_direction(:direction)

    @stock_items = StockItem.search(params[:search]).order("#{sort} #{direction}").paginate(:per_page => 15, :page => params[:page])
  end

  def new
    @stock_item = StockItem.new
  end

  def edit
  end

  def create
    @stock_item = StockItem.new(stock_item_params)

    respond_to do |format|
      if @stock_item.save
        format.js   {}
      else
        generic_form_error_hander(format, 'Erro ao adicionar item', @stock_item.errors.full_messages)
      end
    end
  end

  def update
    respond_to do |format|
      if @stock_item.update(stock_item_params)
        format.js   {}
      else
        generic_form_error_hander(format, 'Erro ao actualizar stock', @stock_item.errors.full_messages)
      end
    end
  end

  def destroy
    @stock_item.destroy

    respond_to do |format|
      format.js { }
    end
  end

  private
    def set_stock_item
      @stock_item = StockItem.find(params[:id])
    end

    def stock_item_params
      params.require(:stock_item).permit(:code, :name, :description, :qtd)
    end
end
