class CreateServers < ActiveRecord::Migration
  def change
    create_table :servers do |t|
      t.string :title
      t.string :hostname

      t.timestamps
    end
  end
end
