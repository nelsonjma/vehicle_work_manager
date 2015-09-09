class WorkTask < ActiveRecord::Base

  belongs_to :task
  belongs_to :work

  has_many :task_items
  has_many :labor_users

  validates_presence_of :task_id,   message: '( selecione uma tarefa )'
  validates_presence_of :ut,        message: '( ut tem de ser preenchida )'
  validates_numericality_of :ut,    message: '( ut é numerica, 1 UT = 15 minutos )'

  before_save :last_update

  def last_update
    self.updated_at = Time.now
  end

  def finish
    self.finished = true
    self.finished_at = Time.now
    self.save
  end

  def set_finished_at(force_set = false)
    if (self.finished && !force_set) || force_set
      self.finished_at = Time.now
    end
  end

end
