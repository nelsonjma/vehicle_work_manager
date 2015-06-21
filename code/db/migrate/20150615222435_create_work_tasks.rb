class CreateWorkTasks < ActiveRecord::Migration
  def change
    create_table :work_tasks do |t|

      t.references :works
      t.references :tasks

      t.integer :ut

      t.timestamps null: false
    end
  end
end
