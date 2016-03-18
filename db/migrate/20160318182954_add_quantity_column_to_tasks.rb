class AddQuantityColumnToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :quantity, :integer 
  end
end
