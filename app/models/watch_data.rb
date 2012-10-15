class WatchData < ActiveRecord::Base
	attr_accessible :raw_data, :value, :watch, :time

	default_scope order("time DESC")

	belongs_to :watch
end
