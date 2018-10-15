class MacOSKey
	@@all = []

	attr_accessor :description, :shortcut, :key_seq

	def initialize(key_seq)
		@key_seq = key_seq
		@@all << key_seq
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
		self.all.each do |key|
			puts "#{self.key_seq}: #{self.shortcut.name}\n"
		end
	end

	def self.search_for_key(search_phrase)

	end
end
