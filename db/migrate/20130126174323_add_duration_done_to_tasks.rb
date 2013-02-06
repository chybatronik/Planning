class AddDurationDoneToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :duration_done, :integer
  end
end
