class DataFormatter
	
	def create_data_array_from_scraper(data)
		shortcut_array = data.split("Block Travel").first.split("\n")
		shortcut_array = shortcut_array.reject { |item| item.nil? || item == ''}.each_slice(5).to_a
		binding.pry
	end
end
