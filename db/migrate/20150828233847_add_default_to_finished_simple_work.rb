class AddDefaultToFinishedSimpleWork < ActiveRecord::Migration
  def change
    change_column :simple_works, :finished, :boolean, default: false
  end
end
