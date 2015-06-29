class WorkTask < ActiveRecord::Base

  belongs_to :task
  belongs_to :work

  has_many :task_items

  validates_presence_of :task_id,   message: '( selecione uma tarefa )'
  validates_presence_of :ut,        message: '( ut tem de ser preenchida )'
  validates_numericality_of :ut,    message: '( ut é numerica, 1 UT = 15 minutos )'

end
