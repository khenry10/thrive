class RenameBelongsToKey < ActiveRecord::Migration
  def change
    remove_column :tasks, :lists_id
    add_column :tasks, :list_id, :integer
  end
end
