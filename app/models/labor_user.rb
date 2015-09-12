class LaborUser < ActiveRecord::Base

  belongs_to :user
  belongs_to :work_task

  validates_presence_of :user_id,   message: '( selecione um utilizador )'

  scope :current_task_labor, -> (work_task_id) { where('work_task_id = ?', work_task_id) }

  before_save :last_update

  def last_update
    self.updated_at = Time.now
  end

end
