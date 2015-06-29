class User < ActiveRecord::Base

  has_many :task_items

  validates :pin, uniqueness: true

  def self.authenticate(pin)
    user = find_by :pin => pin

    return (user.is_a? User) ? user : nil
  end

  def is_admin?
    return true if permission == 0
    return false
  end
end
