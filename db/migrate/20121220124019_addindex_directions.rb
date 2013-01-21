class AddindexDirections < ActiveRecord::Migration
  def up
  	add_index :directions, :id
  	add_index :directions, :created_at
  	add_index :directions, :user_id
  	add_index :directions, :active

  end

  def down
  	remove_index :directions, :id
  	remove_index :directions, :created_at
  	remove_index :directions, :user_id
  	remove_index :directions, :active
  end
end
