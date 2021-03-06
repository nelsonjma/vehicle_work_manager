class VehicleType < ActiveRecord::Base

  has_many :vehicles

  attr_accessor :upload

  before_save :upload_image, prepend: true

  before_save :last_update

  def last_update
    self.updated_at = Time.now
  end

  def upload_image
    return true if self.upload == nil && self.image != nil
    return false if self.upload == nil

    begin
      self.image  = "/img/vehicle_type/#{self.upload.original_filename}"
      path        = "public/img/vehicle_type/#{self.upload.original_filename}"

      File.open(path, 'wb') { |f| f.write(self.upload.read) }
      return true
    rescue
      return false
    end
  end

end
