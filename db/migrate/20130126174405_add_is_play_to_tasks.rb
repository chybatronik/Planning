class AddIsPlayToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :is_play, :boolean
  end
end
