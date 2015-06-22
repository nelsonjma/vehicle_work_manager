class ChangeCPinToString < ActiveRecord::Migration
  def change
    change_column :users, :pin, :string
  end
end
