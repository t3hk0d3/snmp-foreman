class Mib < ActiveRecord::Base
	attr_accessible :module, :name, :oid

	attr_accessible :parent, :children


	# Make low-level caching for all mibs
	def self.all
		Rails.cache.fetch("mibs_all", :expires_in => 5.minutes) do
			Mib.find(:all)
		end
	end

	def self.oid_map
		@oid_map ||= Rails.cache.fetch("mibs_oid_map", :expires_in => 5.minutes) do
			Rails.logger.info("Calculating OID MAP")
			result = {}

			self.all.each do |r|
				result[r.oid] = {name: r.name, module: r.module}
			end

			result
		end
	end

	def self.[] (oid)

		mib = SNMP::ObjectId.new(oid)
		index = []

		until mib.empty?
			str = mib.join('.')

			if oid_map.include? str
				result = oid_map[str].dup

				result[:name] += ".#{index.join('.')}" unless index.empty?

				return result
			end

			index.unshift mib.pop
		end

		{name: oid}
	end
end
