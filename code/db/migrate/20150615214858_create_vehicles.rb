class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|

      t.string :name
      t.string :description
      t.string :vehicle_type_img

      t.timestamps null: false
    end
  end
end
