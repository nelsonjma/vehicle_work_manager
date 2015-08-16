class SimpleWork < ActiveRecord::Base

  has_many :simple_tasks

  validates_presence_of :description,   message: '( descrição tem de ser preenchida )'
  validates_presence_of :notes,         message: '( nota tem de ser preenchida )'

  scope :not_finished_work, -> { where('finished != ? or finished is null', true) }

  before_save :last_update, :finished_at_on_save

  def last_update
    self.updated_at = Time.now
  end

  def finished_at_on_save
    if self.finished
      self.finished_at = Time.now
    elsif self.finished.eql? nil
      self.finished = 0
    end
  end

end
