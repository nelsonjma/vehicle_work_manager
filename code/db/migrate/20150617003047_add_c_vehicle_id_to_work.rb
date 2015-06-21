class AddCVehicleIdToWork < ActiveRecord::Migration
  def change
    add_column :works, :vehicle_id, :integer
  end
end
