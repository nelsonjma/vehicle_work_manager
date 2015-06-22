class RemoveCReferencesWorkTasks < ActiveRecord::Migration
  def change
    remove_column :work_tasks, :works_id
    remove_column :work_tasks, :tasks_id
  end
end
