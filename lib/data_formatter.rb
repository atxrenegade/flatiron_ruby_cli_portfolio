class DataFormatter

	def create_data_array_from_scraper(data)
		shortcut_array = data.split("Block Travel").first.split("\n")
		@shortcut_array = shortcut_array.reject { |item| item.nil? || item == ''}.each_slice(5).to_a
		create_objects_from_data
	end

	def create_objects_from_data
		binding.pry
		@shortcut_array.each {|shortcut| Shortcut.new_from_data_array(shortcut)}
		binding.pry
	end
end
