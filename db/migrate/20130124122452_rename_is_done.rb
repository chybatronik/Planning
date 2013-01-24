class RenameIsDone < ActiveRecord::Migration
  def up
  	rename_column :tasks, :isDone, :is_done
  end

  def down
  	rename_column :tasks, :is_done, :isDone
  end
end
