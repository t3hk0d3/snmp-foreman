class CreateWatchData < ActiveRecord::Migration
  def change
    create_table :watch_data do |t|
      t.integer :watch_id
      t.string :raw_data
      t.string :value

      t.datetime :time
    end

	add_index :watch_data, :watch_id
  end
end
