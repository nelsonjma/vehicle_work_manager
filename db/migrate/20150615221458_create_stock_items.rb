class CreateStockItems < ActiveRecord::Migration
  def change
    create_table :stock_items do |t|

      t.string :code
      t.string :name
      t.text :description
      t.integer :qtd

      t.timestamps null: false
    end
  end
end
