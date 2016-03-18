class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.belongs_to :lists
      t.string :name
      t.string :category
      t.string :priority
      t.text :description
      t.integer :time_estimate
      t.integer :time_actual
      t.decimal :cost
      t.date :deadline
      t.string :image
      t.timestamps
    end
  end
end
