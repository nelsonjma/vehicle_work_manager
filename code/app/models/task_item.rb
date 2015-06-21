class TaskItem < ActiveRecord::Base

  belongs_to :work_task
  belongs_to :user
  belongs_to :stock_item

  scope :current_work_task_items, -> (work_task_id) { joins(:user).joins(:stock_item).where('work_task_id = ?', work_task_id) }

end
