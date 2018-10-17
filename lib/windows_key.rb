class WindowsKey
	@@all = []
	attr_accessor :description, :shortcut, :key_seq

	extend Searchable::ClassMethods

	def initialize(key_seq)
		@key_seq = key_seq
		self.save
	end

	def detail_view
		puts "\n\tShortcut Key Sequence: #{self.key_seq}\n"
		puts "\tShortcut Name: #{self.shortcut.name}\n"
		puts "\tOperating System: WINDOWS OS\n"
		puts "\tShortcut Description: #{self.description}\n"
	end

	def description
		self.shortcut.description.details
	end

	def save
		@@all << self
	end

	def self.all
		@@all
	end

	def self.sort_keys_alphabetically

	end

	def self.list_all_by_key
		puts "\n\n*************************************"
		puts "\n  WINDOWS SHORTCUTS FOR MAC OS"
		puts "\n*************************************\n\n"
		counter = 1
		self.all.each do |key|
			puts "  #{counter}.  #{key.key_seq}: #{key.shortcut.name}\n"
			counter += 1
		end
	end
end
