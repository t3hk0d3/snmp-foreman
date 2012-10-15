module ServersHelper

	def snmp_table(list, prefix, opts = {})


		prefix = SNMP::ObjectId.new(prefix) if prefix.is_a? String

		tree = {}

		list.each do |item|
			name = item[:oid]

			next unless name.subtree_of?(prefix)

			#name = name.index(prefix)
			index = name.pop

			ident = Mib[name.to_str]

			ident = ident[:name] || name

			tree[index] ||= {}

			tree[index][ident] = item[:value]
		end

		tree
	end

	def interface_table(list, opts = {})
		snmp_table(list, '1.3.6.1.2.1.2.2.1')
	end

	def unpack_mac(mac_address)
		mac_address.unpack('CCCCCC').map {|h| ('%02X' % h) if h }.join(':')
	end


	def interface_status(status)
		%w(up down testing)[status.to_i - 1]
	end

end
