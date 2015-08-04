class ChangeStockItemsPriceToFloat < ActiveRecord::Migration
  def change
    change_column :stock_items, :price, :float, default: 0.0
  end
end
