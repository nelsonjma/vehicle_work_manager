class User < ActiveRecord::Base

  has_many :task_items
  has_many :simple_task_items


  validates :pin, uniqueness: true

  before_save :last_update

  def last_update
    self.updated_at = Time.now
  end

  def self.search(search)
    if search && search.to_s.length > 0
      where('name LIKE ?', "%#{search}%",)
    else
      where('1=1')
    end
  end

  def self.authenticate(pin)
    user = find_by :pin => pin

    return (user.is_a? User) ? user : nil
  end

  def is_admin?
    return (self.permission < 3 ? true : false)
  end

  def has_permission?(lvl)
    return self.permission.eql?(lvl)
  end

end
