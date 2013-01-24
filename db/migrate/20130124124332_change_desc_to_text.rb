class ChangeDescToText < ActiveRecord::Migration
  def up
  	change_column :directions, :desc, :text
  end

  def down
  	change_column :directions, :desc, :string
  end
end
