class Work < ActiveRecord::Base

  belongs_to :vehicle

  has_many :work_tasks
  has_many :tasks, through: :work_tasks

  validates_presence_of :description,   message: '( descrição tem de ser preenchida )'
  validates_presence_of :notes,         message: '( nota tem de ser preenchida )'

  scope :current_work_tasks, -> (work_id) { joins(:tasks).where('work_id = ?', work_id) }
  scope :not_finished_work, -> { where('finished != ?', true) }

end
