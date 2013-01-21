class RemoveDirectionIdToTasks < ActiveRecord::Migration
  def up
    remove_column :tasks, :direction
  end

  def down
    add_column :tasks, :direction, :integer
  end
end
