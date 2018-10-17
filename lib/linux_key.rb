class LinuxKey
	@@all = []

	attr_accessor :description, :shortcut, :key_seq

	include Helper::InstanceMethods
	extend Searchable::ClassMethods
	include Memorable::InstanceMethods
	extend Memorable::ClassMethods

	def initialize(key_seq)
		@key_seq = key_seq
		self.save
	end

	def save
		@@all << self
	end

	def detail_view
		puts "\n\tShortcut Key Sequence: #{self.key_seq}\n"
		puts "\tShortcut Name: #{self.shortcut.name}\n"
		puts "\tOperating System: LINUX OS\n"
		puts "\tShortcut Description: #{self.description}\n\n"
	end

	def self.all
		@@all
	end

	def self.list_all_by_key
		puts "\n\n*************************************"
		puts "\n  LINUX SHORTCUTS FOR MAC OS"
		puts "\n*************************************\n\n"
		counter = 1
		self.all.each do |key|
			puts "  #{counter}.  #{key.key_seq}: #{key.shortcut.name}\n"
			counter += 1
		end
	end
end
