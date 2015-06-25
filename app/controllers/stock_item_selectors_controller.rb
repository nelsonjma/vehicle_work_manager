class StockItemSelectorsController < ApplicationController

  before_action :authenticated

  def index
    @stock_items = StockItem.search(params[:search])
  end
  
end
