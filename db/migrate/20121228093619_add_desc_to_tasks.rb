class AddDescToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :desc, :string
  end
end
