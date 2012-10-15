class Watch < ActiveRecord::Base
	attr_accessible :title, :units, :oid, :interval,
	                :server_id, :enabled, :differential,
	                :multiplier, :accuracy, :snmp_community

	belongs_to :server

	has_many :watch_datas, :dependent => :delete_all

	validates :title, :presence => true
	validates :oid, :presence => true
	validates :interval, :numericality => {:greater_than => 0}
	validates :server, :presence => true


	def query
		result = nil

		SNMP::Manager.open(host: server.hostname, :community => self.snmp_community) do |snmp|
			result = snmp.get_value(self.oid)
		end

		result
	end

	def differential?
		self.differential
	end
end
