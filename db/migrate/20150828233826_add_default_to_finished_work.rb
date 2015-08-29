class AddDefaultToFinishedWork < ActiveRecord::Migration
  def change
    change_column :works, :finished, :boolean, default: false
  end
end
