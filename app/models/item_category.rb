class ItemCategory < ActiveRecord::Base

  has_many :stock_items

  validates_presence_of :name,        message: '( nome tem de ser preenchido )'

  def self.search(search)
    if search && search.to_s.length > 0
      where('name LIKE ?', "%#{search}%")
    else
      where('1=1')
    end
  end

end
