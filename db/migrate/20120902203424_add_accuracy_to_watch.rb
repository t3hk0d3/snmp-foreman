class AddAccuracyToWatch < ActiveRecord::Migration
  def change
    add_column :watches, :accuracy, :integer, :null => false, :default => 0
  end
end
