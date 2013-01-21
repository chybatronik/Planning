class AddDirectionIdToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :direction_id, :integer
  end
end
