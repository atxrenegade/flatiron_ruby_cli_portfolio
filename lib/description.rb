class Description
	@@all = []

	attr_accessor :details, :shortcut
	def initialize(details)
		@details = details
	end

	def display
		puts "Description: \n\t #{self.details}\n"
	end

	def search_for_description(search_phrase)

	end

	def shortcut=(shortcut)
		@shortcut = shortcut
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
