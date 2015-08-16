class AddCDetailsToVehicle < ActiveRecord::Migration
  def change
    add_column :vehicles, :marca,       :string
    add_column :vehicles, :matricula,   :string
    add_column :vehicles, :corporacao,  :string
  end
end
