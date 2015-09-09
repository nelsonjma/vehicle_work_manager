class AddDefaultToFinishedWorkTask < ActiveRecord::Migration
  def change
    change_column :work_tasks, :finished, :boolean, default: false
  end
end
