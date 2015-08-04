class ChangeStockItemsMinQtdToAddDefault < ActiveRecord::Migration
  def change
    change_column :stock_items, :qtd_min, :integer, default: 0
  end
end
