class AddCFinishedDateToWorkTasks < ActiveRecord::Migration
  def change
    add_column :work_tasks, :finished_at, :timestamp
  end
end
