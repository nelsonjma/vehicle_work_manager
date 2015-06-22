class WorkTask < ActiveRecord::Base

  belongs_to :task
  belongs_to :work

  has_many :task_items

end
