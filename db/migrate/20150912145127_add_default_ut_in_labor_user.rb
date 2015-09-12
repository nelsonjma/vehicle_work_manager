class AddDefaultUtInLaborUser < ActiveRecord::Migration
  def change
    change_column :labor_users, :ut, :integer, default: 0
  end
end
