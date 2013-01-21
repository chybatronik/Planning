class AddindexTasks < ActiveRecord::Migration
  def up
  	add_index :tasks, :id, :unique => true
  	add_index :tasks, :direction_id
  	add_index :tasks, :created_at
  	add_index :tasks, :isDone
  end

  def down
  	remove_index :tasks, :id
  	remove_index :tasks, :direction_id
  	remove_index :tasks, :created_at
  	remove_index :tasks, :isDone
  end
end
