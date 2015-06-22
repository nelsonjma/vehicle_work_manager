class Task < ActiveRecord::Base

  has_many :works, through: :work_tasks

end
