class Description
	@@all = []

	attr_accessor :details, :shortcut

	def initialize(details)
		@details = details
		self.save
	end

	def save
		@@all << self
	end

	def self.all
		@@all
	end

	def self.list_all_by_description
		self.each do |description|
			puts "#{description.display}:"
			puts "Shortcut Name: #{self.shortcut.name}\n"
		end
	end

	def self.search_description(search_phrase)

	end
end
