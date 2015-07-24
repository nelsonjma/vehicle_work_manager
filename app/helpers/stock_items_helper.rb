module StockItemsHelper

  def item_categories_list
    ItemCategory.all.collect { |ic| [ic.name, ic.id] }
  end

end
