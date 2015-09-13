class Task < ActiveRecord::Base

  has_many :works, through: :work_tasks

  validates_presence_of :name,        message: '( nome tem de ser preenchido )'
  #validates_presence_of :description, message: '( descrição tem de ser preenchida )'

  before_save :last_update

  def last_update
    self.updated_at = Time.now
  end

  def self.search(search)
    if search && search.to_s.length > 0
      where('tasks.name LIKE ? OR tasks.description like ?', "%#{search}%", "%#{search}%")
    else
      where('1=1')
    end
  end

end
