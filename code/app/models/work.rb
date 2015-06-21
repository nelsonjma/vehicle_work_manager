class Work < ActiveRecord::Base

  belongs_to :vehicle

  has_many :work_tasks
  has_many :tasks, through: :work_tasks

  scope :current_work_tasks, -> (work_id) { joins(:tasks).where('work_id = ?', work_id) }

end
