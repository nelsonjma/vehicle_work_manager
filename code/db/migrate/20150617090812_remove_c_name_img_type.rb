class RemoveCNameImgType < ActiveRecord::Migration
  def change
    remove_column :vehicles, :name
    remove_column :vehicles, :vehicle_type_img
  end
end
