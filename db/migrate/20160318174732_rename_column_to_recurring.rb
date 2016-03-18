class RenameColumnToRecurring < ActiveRecord::Migration
  def change
    rename_column :lists, :string, :recurring
  end
end
