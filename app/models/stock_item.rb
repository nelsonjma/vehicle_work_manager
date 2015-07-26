class StockItem < ActiveRecord::Base

  has_many :task_items

  belongs_to :item_category

  validates_presence_of :code,              message: '( codigo tem de ser preenchido )'
  validates_presence_of :name,              message: '( nome tem de ser preenchido )'
  validates_presence_of :description,       message: '( descrição tem de ser preenchida )'
  validates_presence_of :qtd,               message: '( quantidade tem de ser preenchida )'
  validates_presence_of :qtd_min,           message: '( quantidade minima tem de ser preenchida )'
  validates_presence_of :item_category_id,  message: '( selecione uma categoria )'

  validates_numericality_of :qtd,     message: '( quantidade tem de ser numerica )'
  validates_numericality_of :qtd_min, message: '( quantidade minima tem de ser numerica )'
  validates_numericality_of :code,    message: '( codigo tem de ser numerica )'

  scope :search_by_id, -> (id) { where('id = ?', id) }

  before_save :last_update

  def last_update
    self.updated_at = Time.now
  end


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
        where('stock_items.name LIKE ? OR item_category_id in (?)',
              "%#{search}%",
              ItemCategory.where('name LIKE ?', "%#{search}%").select(:id))
      end
    else
      where('1=1')
    end
  end

end
