class AddLimitToDirections < ActiveRecord::Migration
  def change
    add_column :directions, :isLimit, :boolean
  end
end
