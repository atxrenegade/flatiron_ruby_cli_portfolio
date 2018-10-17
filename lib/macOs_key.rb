class MacOSKey
	@@all = []

	attr_accessor :description, :shortcut, :key_seq

	extend Searchable::ClassMethods
	include Memorable::InstanceMethods
	extend Memorable::ClassMethods

	def initialize(key_seq)
		@key_seq = key_seq
		self.save
	end

	def detail_view
		puts "\n\tShortcut Key Sequence: #{self.key_seq}\n"
		puts "\tShortcut Name: #{self.shortcut.name}\n"
		puts "\tOperating System: Mac OS\n"
		puts "\tShortcut Description: #{self.description}\n\n"
	end

	def description
		self.shortcut.description.details
	end

	def self.list_all_by_key
		puts "\n\n*************************************"
		puts "\n  ATOM SHORTCUTS FOR MAC OS"
		puts "\n*************************************\n\n"
		counter = 1
		self.all.each do |key|
			puts "  #{counter}.  #{key.key_seq}: #{key.shortcut.name}\n"
			counter += 1
		end
	end
end
