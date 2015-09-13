module TaskItemsHelper

  def stock_item_list
    StockItem.all.collect { |si| ["#{si.code} - #{si.name}", si.id] }
  end

  def remove_from_stock(stock_item_id, current_qtd, old_qtd = 0)
    StockItem.remove_stock(stock_item_id, (current_qtd - old_qtd))
  end

  def build_stock_item_name(name)
    if name
      return capture { concat text_field_tag :stock_item_name, name, class: 'form-control' }
    else
      return capture { concat text_field_tag :stock_item_name, nil, class: 'form-control' }
    end
  end

end
