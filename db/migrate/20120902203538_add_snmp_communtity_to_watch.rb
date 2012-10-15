class AddSnmpCommuntityToWatch < ActiveRecord::Migration
  def change
    add_column :watches, :snmp_community, :string, :null => false, :default => 'public'
  end
end
