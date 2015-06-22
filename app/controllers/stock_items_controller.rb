class StockItemsController < ApplicationController

  before_action :authenticated

  before_action :set_stock_item, only: [:edit, :update, :destroy]

  def index
    @stock_items = StockItem.all

    @stock_item = StockItem.new
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
        format.json { render json: @stock_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @stock_item.update(stock_item_params)
        format.js   {}
      else
        format.json { render json: @stock_item.errors, status: :unprocessable_entity }
        #format.js { render :js => "alert('error');" }
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
      params.require(:stock_item).permit(:code,:name, :description, :qtd)
    end
end
