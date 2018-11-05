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
		create_shortcuts_array(revised_array)
	end

	#create object arrays for each shortcut for each operating system
	def create_shortcuts_array(revised_array)
		shortcuts_array = []
		revised_array.each do |array|
			array[0].downcase!
			array[1].upcase!
			array[2].upcase!
			array[3].upcase!
			array[4].downcase!
    		shortcuts_array << [array[0], array[1], array[4], "Mac"] << [array[0], array[2],array[4], "Windows"] << [array[0], array[3], array[4], "Linux"]
		end
		parse_attribute_array(shortcuts_array)
	end

	#parse array to create shortcut objects
	def parse_attribute_array(shortcuts_array)
		shortcuts_array.each do |shortcut_array|
			Shortcut.create_from_attribute_array(shortcut_array)
		end
	end
end
