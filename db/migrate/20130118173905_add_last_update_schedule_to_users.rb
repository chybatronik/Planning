class AddLastUpdateScheduleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :last_update_schedule, :datetime
  end
end
