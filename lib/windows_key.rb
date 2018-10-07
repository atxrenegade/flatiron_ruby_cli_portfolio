class WindowsKey
	attr_accessor :description, :shortcut, :key_seq

	def initialize(key_seq)
		@key_seq = key_seq
		@shortcuts = []
	end

	def display
		puts "Windows Key: \n\t #{self}\n"
	end

	def search_for_key(search_phrase)

	end

	def create_key(key_seq)
		key = WindowsKey.new(key_seq)
		key.save
		key
	end

	def list_all_by_key
		self.all.each do |key|
			puts "Windows Key: #{self.key_seq}:"
			puts "Shortcut Name: #{self.shortcut.name}\n"
			puts "Mac Key: #{self.shortcut.mac_key}\n"
			puts "Linux Key: #{self.shortcut.linux_key}\n\n\n"
		end
	end

	def save
		@@all << self
	end

	def self.all
		@@all
	end
end
