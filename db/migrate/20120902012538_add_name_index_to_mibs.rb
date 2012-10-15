class AddNameIndexToMibs < ActiveRecord::Migration
  def change
	  add_index :mibs, [:name, :module]
  end
end
