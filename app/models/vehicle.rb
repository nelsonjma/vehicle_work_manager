class Vehicle < ActiveRecord::Base

  has_many :works
  belongs_to :vehicle_type

  validates_presence_of :description,     message: '( descrição tem de ser preenchida )'
  validates_presence_of :vehicle_type_id, message: '( selecione tipo de veiculo )'

  scope :with_work_not_finished, -> { joins(:works).where('finished != ?', true) }

  before_save :last_update

  def last_update
    self.updated_at = Time.now
  end

end
