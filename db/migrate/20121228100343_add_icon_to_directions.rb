class AddIconToDirections < ActiveRecord::Migration
  def change
    add_column :directions, :icon, :string
  end
end
