class LaborUser < ActiveRecord::Base

  belongs_to :user
  belongs_to :work_task

  before_save :last_update

  def last_update
    self.updated_at = Time.now
  end

end
