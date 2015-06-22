class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|

      t.string :description
      t.text :notes

      t.timestamps null: false
    end
  end
end
