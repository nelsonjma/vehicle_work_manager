class TaskItem < ActiveRecord::Base

  belongs_to :work_task
  belongs_to :user
  belongs_to :stock_item

  validates_presence_of :qtd,           message: '( quantidade tem de ser preenchida )'
  validates_presence_of :note,          message: '( notas tem de ser preenchidas )'
  validates_presence_of :work_task_id,  message: '( selecione um item )'

  validates_numericality_of :qtd,       message: '( quantidade tem de ser numerica )'

  scope :current_work_task_items, -> (work_task_id) { joins(:user).joins(:stock_item).where('work_task_id = ?', work_task_id) }

end
