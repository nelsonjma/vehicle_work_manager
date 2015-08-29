class AddCStartWorkAtToWork < ActiveRecord::Migration
  def change
    add_column :works, :start_work_at, :timestamp
  end
end
