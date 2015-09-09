class CreateLaborUsers < ActiveRecord::Migration
  def change
    create_table :labor_users do |t|

      t.references :work_task
      t.references :user

      t.integer :ut

      t.timestamps null: false
    end
  end
end
