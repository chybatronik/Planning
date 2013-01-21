class AddDescToDirections < ActiveRecord::Migration
  def change
    add_column :directions, :desc, :string
  end
end
