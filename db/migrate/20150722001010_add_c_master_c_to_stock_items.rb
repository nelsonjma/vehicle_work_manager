class AddCMasterCToStockItems < ActiveRecord::Migration
  def change
    add_column :stock_items, :qtd_min, :integer
  end
end
