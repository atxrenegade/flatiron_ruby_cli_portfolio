class MacOSKey
	@all

	attr_accessor :description, :shortcut, :key_seq

	def initialize(key_seq)
		@key_seq = key_seq
		@shortcuts = []
	end

	def display
		puts "MacOS Key: \n\t #{self}\n"
	end

	def search_for_key(search_phrase)

	end

	def create_key(key_seq)
		key = MacOSKey.new(key_seq)
		key.save
		key
	end

	def list_all_by_key
		self.all.each do |key|
			puts "MacOS Key: #{self.key_seq}:"
			puts "Shortcut Name: #{self.shortcut.name}\n"
			puts "Linux Key: #{self.shortcut.linux_key}\n"
			puts "Windows Key: #{self.shortcut.windows_key}\n\n\n"
		end
	end

	def save
		@@all << self
	end

	def self.all
		@@all
	end

end
