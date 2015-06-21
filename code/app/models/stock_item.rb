class StockItem < ActiveRecord::Base

  has_many :task_items

  def self.remove_stock(id, qtd)
    stock_item = StockItem.find(id)
    stock_item.qtd = stock_item.qtd - qtd
    stock_item.save
  end

end
