class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :desc
      t.string :dir

      t.timestamps
    end
  end
end
