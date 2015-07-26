class AddCFinishedDateToWorks < ActiveRecord::Migration
  def change
    add_column :works, :finished_at, :timestamp
  end
end
