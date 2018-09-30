class DataFormatter
	def initialize
	end

	def create_data_array_from_scraper
		binding.pry
		shortcut = @shortcut_string.split("Block Travel").first
		shortcut = shortcut.first.split("\n")
		shortcut = shortcut.reject { |item| item.nil? || item == ''}
		shortcut = shortcut.each_slice(5).to_a
		shortcut.object_hash_from_array
	end

	def object_hash_from_array

		shortcut.each do |atom_array|
			@shortcut = Shortcut.new(atom_array[0])
			@shortcut.name = atom_array[0] #is this redundant?
			@shortcut.description = atom_array[4]
			#how do I add key sequences

			@shortcut_key = Shortcut_key.new(atom_array[1], atom_array[2], atom_array[3])
			@shortcut_key.mac = atom_array[1]
			@shortcut_key.windows = atom_array[2]
			@shortcut_key.linux = atom_array[3]

			@shortcut.shortcut_key = @shortcut_key
			@shortcut.save
		end
	end
end
