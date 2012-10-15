class CreateWatches < ActiveRecord::Migration
	def change
		create_table :watches do |t|
			t.integer :server_id
			t.string :oid
			t.string :title
			t.string :units
			t.integer :interval
			t.boolean :enabled
			t.boolean :differential

			t.timestamps
		end

		add_index :watches, :server_id
	end
end
