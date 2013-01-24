class RenameDirectionsIsLimit < ActiveRecord::Migration
  def up
  	rename_column :directions, :isLimit, :is_limit
  end

  def down
  	rename_column :directions, :is_limit, :isLimit
  end
end
