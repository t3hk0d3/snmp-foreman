# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


mib = SNMP::MIB.new()

puts "Importing MIB modules"

if ENV['ALLMODULES']
	modules = Dir["#{SNMP::MIB::DEFAULT_MIB_PATH}/*.yaml"].map { |file| File::basename(file, '.yaml') }
else
	modules = SNMP::Options.default_modules
end

puts "Loading #{modules.size} modules"

modules.each do |mod|
	mib.load_module mod
end

puts "Importing modules"

imported_oids = 0
imported_modules = 0
mib.by_module_by_name.each_pair do |mod, oids|
	puts "Importing #{mod} (#{oids.size} OIDs) (#{imported_modules}/#{modules.size})"
	oids.each do |name, oid|
		begin
			Mib.create(:oid => oid, :name => name, :module => mod)
			imported_oids += 1
		rescue
		end

	end
	imported_modules += 1
end

puts "Imported #{imported_oids} MIB OIDs"




