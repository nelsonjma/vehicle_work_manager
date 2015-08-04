class AddCPriceToStockItems < ActiveRecord::Migration
  def change
    add_column :stock_items, :price, :integer, default: 0
  end
end
