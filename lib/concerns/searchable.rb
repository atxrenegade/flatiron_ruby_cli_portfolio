module Searchable
	module InstanceMethods

	end
	
	module ClassMethods
		def search_by_name(name)
			self.all.each do |key|
				if key.shortcut.name == name
					@found_key = key
				end
			end
			if @found_key.nil?
					puts "\nThat name was not found.\n"
					puts "Please try again or choose a different name."
				else
					puts "\n"
					@found_key.detail_view
			end
		end

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
		end

		def search_by_number(number)
			counter = 0
			self.all.each do |key|
				counter += 1
				if counter.to_s == number
					key.detail_view
				end
			end
		end
	end
end