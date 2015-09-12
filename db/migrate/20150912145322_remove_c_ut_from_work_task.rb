class RemoveCUtFromWorkTask < ActiveRecord::Migration
  def change
    remove_column :work_tasks, :ut
  end
end
