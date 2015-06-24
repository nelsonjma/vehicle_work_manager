class StockItem < ActiveRecord::Base

  has_many :task_items

  scope :search_by_id, -> (id) { where('id = ?', id) }

  def self.remove_stock(id, qtd)
    stock_item = StockItem.find(id)
    stock_item.qtd = stock_item.qtd - qtd
    stock_item.save
  end

  def self.search(search)
    if search && search.to_s.length > 0
      if search.to_i.to_s == search
        where('code = ?', search)
      else
        where('name LIKE ?', "%#{search}%")
      end
    else
      where('1=1')
    end
  end

end
