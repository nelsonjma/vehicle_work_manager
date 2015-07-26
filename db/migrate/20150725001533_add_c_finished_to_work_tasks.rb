class AddCFinishedToWorkTasks < ActiveRecord::Migration
  def change
    add_column :work_tasks, :finished, :boolean
  end
end
