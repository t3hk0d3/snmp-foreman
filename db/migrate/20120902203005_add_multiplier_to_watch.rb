class AddMultiplierToWatch < ActiveRecord::Migration
  def change
    add_column :watches, :multiplier, :float, :null => false, :default => 1
  end
end
