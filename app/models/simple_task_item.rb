class SimpleTaskItem < ActiveRecord::Base

  belongs_to :user
  belongs_to :simple_task
  belongs_to :stock_item

  validates_presence_of :qtd,           message: '( quantidade tem de ser preenchida )'

  before_save :last_update

  def last_update
    self.updated_at = Time.now
  end

end
