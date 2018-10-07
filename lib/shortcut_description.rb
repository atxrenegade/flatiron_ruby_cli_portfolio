class ShortcutDescription
	@all

	attr_accessor :description, :shortcut

	def initialize(description)
		@description = description
		@shortcuts = []
	end

	def display
		puts "Description: \n\t #{self}\n"
	end

	def create_shortcut_description(description)
		description = ShortcutDescription.new(description)
		description.save
		description
	end

	def save
		@@all << self
	end

	def self.all
		@@all
	end


end
