class AddDefaultToFinishedSimpleTask < ActiveRecord::Migration
  def change
    change_column :simple_tasks, :finished, :boolean, default: false
  end
end
