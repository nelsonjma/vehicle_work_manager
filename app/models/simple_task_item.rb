class SimpleTaskItem < ActiveRecord::Base

  belongs_to :user
  belongs_to :simple_task
  belongs_to :stock_item

  validates_presence_of :qtd,           message: '( quantidade tem de ser preenchida )'

  scope :current_task_items, -> (task_id) { joins(:user).joins(:stock_item).where('simple_task_id = ?', task_id) }

  before_save :last_update

  def last_update
    self.updated_at = Time.now
  end

end
