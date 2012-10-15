class AddTimeIndexToWatchData < ActiveRecord::Migration
  def change
    add_index :watch_data, [:watch_id, :time], :unique => true
  end
end
