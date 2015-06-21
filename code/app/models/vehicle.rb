class Vehicle < ActiveRecord::Base

  has_many :works
  belongs_to :vehicle_type

  scope :with_work_not_finished, -> { joins(:works).where('finished != ?', true) }

end
