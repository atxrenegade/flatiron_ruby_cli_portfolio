module Searchable
	module InstanceMethods
		def search_by_number(number)
			if number.to_i > 45
				CLIInterface.not_found
			else
				shortcuts.each_with_index do |key, index|
					if (index + 1).to_s == number
						CLIInterface.detail_view(key)
					end	
				end
			end
		end

		def search_by_name(name)
			shortcuts.each do |key|
				if key.name.include?(name)
					@found_key = key
				end
			end
			if @found_key.nil?
				CLIInterface.not_found
			else
				CLIInterface.detail_view(@found_key)
			end
			@found_key = nil
		end

		def search_by_key(key_to_find)
			shortcuts.each do |key|
				if key.key_seq == key_to_find
					@found_key = key
				end
			end
			if @found_key.nil?
				CLIInterface.not_found
			else
				CLIInterface.detail_view(@found_key)
			end
			@found_key = nil
		end
	end
end
