class AddIndexOfDayToSchedules < ActiveRecord::Migration
  def change
    add_column :schedules, :indexOfDay, :integer
  end
end
