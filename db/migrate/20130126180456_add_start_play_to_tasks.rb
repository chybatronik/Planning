class AddStartPlayToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :start_play, :datetime
  end
end
