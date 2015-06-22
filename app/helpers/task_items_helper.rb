module TaskItemsHelper

  def stock_item_list
    StockItem.all.collect { |si| ["#{si.code} - #{si.name}", si.id] }
  end

  def current_user_id
    current_user.id
  end

  def current_user_name
    current_user.name
  end

  def remove_from_stock(stock_item_id, current_qtd, old_qtd = 0)
    StockItem.remove_stock(stock_item_id, (current_qtd - old_qtd))
  end

  def current_stock_item(id)
    StockItem.find(id)
  end

end