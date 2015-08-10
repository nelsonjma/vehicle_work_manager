class CreateSimpleTasks < ActiveRecord::Migration
  def change
    create_table :simple_tasks do |t|

      t.references :simple_work

      t.string :name
      t.string :description

      t.boolean :finished
      t.timestamp :finished_at

      t.timestamps null: false
    end
  end
end
