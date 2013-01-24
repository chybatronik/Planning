class RenameScheduleIsDone < ActiveRecord::Migration
  def up
  	rename_column :schedules, :isDone, :is_done
  	rename_column :schedules, :indexOfDay, :index_of_day
  end

  def down
  	rename_column :schedules, :is_done, :isDone
  	rename_column :schedules, :index_of_day, :indexOfDay
  end
end
