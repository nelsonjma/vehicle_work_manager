class AddCReferencesWorkTasks < ActiveRecord::Migration
  def change
    add_column :work_tasks, :work_id, :integer
    add_column :work_tasks, :task_id, :integer
  end
end
