class DataFormatter
	def create_data_array_from_scraper(data)
		#remove uneccessary data from array
		shortcut_array = data.split("Block Travel").first.split("\n")

		#remove blank strings
		shortcut_array = shortcut_array.reject { |item| item.nil? || item == ''}

		#find index number of first set of empty table values
		insert_location = shortcut_array.index("ctrl-shift-o")
		#insert n/a values into array
   		revised_array = shortcut_array.insert(insert_location + 1, "No key for this OS", "No key for this OS" )

		#find second location of empty table values
		insert_location = shortcut_array.index("alt-cmd-s")
		#insert n/a values into array
		revised_array = shortcut_array.insert(insert_location + 1, "No key for this OS", "No key for this OS")

		#split array to sub arrays for object hashes
		revised_array = revised_array.each_slice(5).to_a
		binding.pry

		parse_attribute_array(revised_array)
	end


	def parse_attribute_array(attribute_array)
		attribute_array.each do |shortcut_array|
			Shortcut.create_from_attribute_hash(shortcut_array)
		end
	end
end
