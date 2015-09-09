class AddDefaultUtInWorkTask < ActiveRecord::Migration
  def change
    change_column :work_tasks, :ut, :integer, default: 0
  end
end
