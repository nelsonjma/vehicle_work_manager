class CreateSimpleTaskItems < ActiveRecord::Migration
  def change
    create_table :simple_task_items do |t|

      t.references :simple_task
      t.references :user
      t.references :stock_item

      t.text :note
      t.integer :qtd

      t.timestamps null: false
    end
  end
end
