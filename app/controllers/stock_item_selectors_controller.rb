class StockItemSelectorsController < ApplicationController

  before_action :authenticated

  def index
    @stock_items = StockItem.search(params[:search])
                       .joins(:item_category)
                       .select('stock_items.*, item_categories.name as cat_name')
  end
  
end
