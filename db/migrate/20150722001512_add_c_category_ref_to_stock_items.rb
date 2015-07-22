class AddCCategoryRefToStockItems < ActiveRecord::Migration
  def change
    add_column :stock_items, :item_category_id, :integer
  end
end
