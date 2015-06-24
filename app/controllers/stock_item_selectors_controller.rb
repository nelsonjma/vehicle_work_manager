class StockItemSelectorsController < ApplicationController

  def index
    @stock_items = StockItem.search(params[:search])
  end
  
end
