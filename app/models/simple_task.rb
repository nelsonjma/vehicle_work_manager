class SimpleTask < ActiveRecord::Base

  belongs_to :simple_work

  has_many :task_items

  validates_presence_of :name,        message: '( nome tem de ser preenchido )'
  validates_presence_of :description, message: '( descrição tem de ser preenchida )'

  scope :current_work_tasks, -> (work_id) { where('simple_work_id = ?', work_id) }

  before_save :last_update, :finished_at_on_save

  def last_update
    self.updated_at = Time.now
  end

  def finished_at_on_save
    if self.finished
      self.finished_at = Time.now
    end
  end

end
