class User < ActiveRecord::Base

  has_many :task_items

  def self.authenticate(pin)
    user = find_by :pin => pin

    return (user.is_a? User) ? user : nil
  end
end
