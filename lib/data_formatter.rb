class DataFormatter
	def create_data_array_from_scraper(data)
		shortcut_array = data.split("Block Travel").first.split("\n")
		shortcut_array = shortcut_array.reject { |item| item.nil? || item == ''}.each_slice(5).to_a
		#binding.pry
		create_array_of_hashed_attributes(shortcut_array)
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
			binding.pry
			Shortcut.new(shortcut_hash) #to be replaced
		end
	end
end

#Shortcut.create_from_attribute_array(shortcut_hash)
