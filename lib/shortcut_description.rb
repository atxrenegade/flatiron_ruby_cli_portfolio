class ShortcutDescription
	@all

	attr_accessor :description, :shortcut
	def initialize(description)
		@description = description
		@shortcuts = []
	end

	def display
		puts "Description: \n\t #{self.description}\n"
	end

	def search_for_description(search_phrase)

	end

	def create_shortcut_description(description)
		description = ShortcutDescription.new(description)
		description.save
		description
	end

	def list_all_by_description
		self.all.each do |description|
			puts "#{description.display}:"
			puts "Shortcut Name: #{self.shortcut.name}\n"
			puts "Mac Key: #{self.shortcut.mac_key}\n"
			puts "Windows Key: #{self.shotcut.windows_key}\n"
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
