class AddCFinishedToWork < ActiveRecord::Migration
  def change
    add_column :works, :finished, :boolean
  end
end
