class DataFormatter
	def create_data_array_from_scraper(data)
		#remove uneccessary data from array
		shortcut_array = data.split("Block Travel").first.split("\n")

		#remove blank strings
		shortcut_array = shortcut_array.reject { |item| item.nil? || item == ''}

		#find index number of first set of empty table values
		insert_location = shortcut_array.index("ctrl-shift-o")
		#insert n/a values into array
   		revised_array = shortcut_array.insert(insert_location + 1, "n/a", "n/a")

		#find second location of empty table values
		insert_location = shortcut_array.index("alt-cmd-s")
		#insert n/a values into array
		revised_array = shortcut_array.insert(insert_location + 1, "n/a", "n/a")

		#split array to sub arrays for object hashes
		revised_array = revised_array.each_slice(5).to_a

		create_array_of_hashed_attributes(revised_array)
	end

	def create_array_of_hashed_attributes(array)
		attribute_array = array.collect do |attribute|
		    command = {
		    "command_name": attribute[0],
		    "mac_key": attribute[1],
		    "windows_key": attribute[2],
		    "linux_key": attribute[3],
		    "description": attribute[4]
		}
		end
		parse_attribute_array(attribute_array)
	end

	def parse_attribute_array(attribute_array)
		attribute_array.each do |shortcut_hash|
			Shortcut.create_from_attribute_hash(shortcut_hash)
		end
	end
end
