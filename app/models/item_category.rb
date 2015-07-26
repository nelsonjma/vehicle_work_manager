class ItemCategory < ActiveRecord::Base

  has_many :stock_items

  validates_presence_of :name,        message: '( nome tem de ser preenchido )'

  before_save :last_update

  def last_update
    self.updated_at = Time.now
  end

  def self.search(search)
    if search && search.to_s.length > 0
      where('name LIKE ?', "%#{search}%")
    else
      where('1=1')
    end
  end

end
