class AddCStartWorkAtToSimpleWork < ActiveRecord::Migration
  def change
    add_column :simple_works, :start_work_at, :timestamp
  end
end
