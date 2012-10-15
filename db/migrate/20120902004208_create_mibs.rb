class CreateMibs < ActiveRecord::Migration
  def change
    create_table :mibs do |t|
      t.string :oid
      t.string :name
      t.string :module
    end

	add_index :mibs, :oid, :unique => true
  end
end
