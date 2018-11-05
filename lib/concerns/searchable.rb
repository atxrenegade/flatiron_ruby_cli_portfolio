module Searchable
	module InstanceMethods
		def search_by_number(number)
			shortcuts.each_with_index do |key, index|
				if (index + 1).to_s == number
					CLIInterface.detail_view(key)
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
					puts "\nThat name was not found.\n"
					puts "Please try again or choose a different name."
				else
					puts "\n"
					binding.pry
					CLIInterface.detail_view(@found_key)
			end
			@found_key = nil
		end
	end
	module ClassMethods
		def search_by_key(key_to_find)
			self.all.each do |key|
				if key.key_seq == key_to_find
					@found_key = key
				end
			end
			if @found_key.nil?
					puts "\nThat key was not found.\n"
					puts "Please try again or choose a different key."
				else
					puts "\n"
					@found_key.detail_view
			end
			@found_key = nil
		end
	end
end
