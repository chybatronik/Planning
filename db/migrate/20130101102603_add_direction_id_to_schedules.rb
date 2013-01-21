class AddDirectionIdToSchedules < ActiveRecord::Migration
  def change
    add_column :schedules, :direction_id, :integer
  end
end
