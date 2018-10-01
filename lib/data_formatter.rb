class DataFormatter
	def initialize
	end

	def create_data_array_from_scraper(data)
		shortcut_array = data.split("Block Travel").first.split("\n")
		shortcut_array = shortcut_array.reject { |item| item.nil? || item == ''}.each_slice(5).to_a
		binding.pry
		#objects hash
	end

	def object_hash_from_array

		@object_hash = []
		@shortcut_array.each do |atom_array|
			#how can I create a Hash with the following values:

			shortcut["name"] = atom_array[0]
			shortcut["mac"] = atom_array[1]
			shortcut["windows"] = atom_array[2]
			shortcut["linux"] = atom_array[3]
			shortcut["description"] = atom_array[4]
			@object_hash << shortcut
		end
	end
end
