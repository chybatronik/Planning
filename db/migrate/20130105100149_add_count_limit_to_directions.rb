class AddCountLimitToDirections < ActiveRecord::Migration
  def change
    add_column :directions, :count_limit, :integer, :default => 3, :null => false
  end
end
