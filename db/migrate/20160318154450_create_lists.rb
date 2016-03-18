class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :name
      t.string :type
      t.string :category
      t.integer :list_time
      t.decimal :list_cost
      t.date :deadline
      t.string :string
      t.timestamps
    end
  end
end
