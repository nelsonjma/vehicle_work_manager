class Work < ActiveRecord::Base

  belongs_to :vehicle

  has_many :work_tasks
  has_many :tasks, through: :work_tasks

  validates_presence_of :description,   message: '( descrição tem de ser preenchida )'
  validates_presence_of :notes,         message: '( nota tem de ser preenchida )'

  scope :current_work_tasks, -> (work_id) { joins(:tasks).where('work_id = ?', work_id) }
  scope :not_finished_work, -> { where('finished != ?', true) }

  before_save :last_update, :finished_at_on_save

  def last_update
    self.updated_at = Time.now
  end

  def finished_at_on_save
    if self.finished
      self.finished_at = Time.now
    end
  end

  def finished?
    return self.finished
  end

end
