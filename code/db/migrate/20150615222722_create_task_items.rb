class CreateTaskItems < ActiveRecord::Migration
  def change
    create_table :task_items do |t|

      t.references :work_task
      t.references :user
      t.references :stock_item

      t.text :note
      t.integer :qtd

      t.timestamps null: false
    end
  end
end
