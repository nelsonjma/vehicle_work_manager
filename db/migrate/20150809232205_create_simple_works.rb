class CreateSimpleWorks < ActiveRecord::Migration
  def change
    create_table :simple_works do |t|

      t.string :description
      t.string :notes

      t.boolean :finished
      t.timestamp :finished_at

      t.timestamps null: false
    end
  end
end
