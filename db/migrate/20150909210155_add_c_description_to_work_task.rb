class AddCDescriptionToWorkTask < ActiveRecord::Migration
  def change
    add_column :work_tasks, :description, :string
  end
end
