namespace :foreman do

	desc "Poll server watches"
	task :poll => :environment do

		Watch.find_all_by_enabled(true).each do |watch|
			now = Time.now
			previous_data = WatchData.find_by_watch_id(watch)

			delta = now - previous_data.time

			next if delta < (watch.interval * 60)

			puts "Polling #{watch.title} (#{watch.interval} / #{delta})"

			# Make SNMP query
			result = watch.query

			raw_data = value =
				case result
					when SNMP::Integer
						result.to_i
					else
						result.to_s
				end

			if watch.differential?
				value = if previous_data then
					        (raw_data - previous_data.raw_data.to_f) / delta * watch.multiplier
				        end
			end

			puts "Result: #{watch.title} - #{raw_data} - #{value}"

			WatchData.create(:watch => watch, :raw_data => raw_data, :value => value, :time => now)

			watch.touch
		end

	end
end