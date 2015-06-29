class Task < ActiveRecord::Base

  has_many :works, through: :work_tasks

  validates_presence_of :name,        message: '( nome tem de ser preenchido )'
  validates_presence_of :description, message: '( descrição tem de ser preenchida )'

end
