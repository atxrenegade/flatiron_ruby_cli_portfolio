class MacOSKey
	@@all = []

	attr_accessor :description, :shortcut, :key_seq

	def initialize(key_seq)
		@key_seq = key_seq
		self.save
		#do I need to add reciprocity here?
	end

	def detail_view
		puts "Shortcut Key Sequence: #{self.key_seq}\n"
		puts "Shortcut Name: #{self.shortcut.name}\n"
		puts "Operating System: Mac OS\n"
		puts "Shortcut Description: #{self.description}\n\n"
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
		puts "\n  ATOM SHORTCUTS FOR MAC OS"
		puts "\n*************************************\n\n"
		counter = 1
		self.all.each do |key|
			puts "  #{counter}.  #{key.key_seq}: #{key.shortcut.name}\n"
			counter += 1
		end
	end

	def self.search_for_key(search_phrase)

	end
end
