class LinuxKey
	@@all = []

	attr_accessor :description, :shortcut, :key_seq

	def initialize(key_seq)
		@key_seq = key_seq
		self.save
	end

	def detail_view
		puts "Shortcut Key Sequence: #{self.key_seq}\n"
		puts "Shortcut Name: #{self.shortcut.name}\n"
		puts "Operating System: LINUX OS\n"
		puts "Shortcut Description: #{self.description.details}\n\n"
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
		#sort_alphabetically then display
		puts "\n\n*************************************"
		puts "\n  LINUX SHORTCUTS FOR MAC OS"
		puts "\n*************************************\n\n"
		counter = 1
		self.all.each do |key|
			puts "  #{counter}.  #{key.key_seq}: #{key.shortcut.name}\n"
			counter += 1
		end
	end

	def self.search_by_name(name)
		self.all.each do |linux_key|
			if linux_key.shortcut.name == name
				@found_key = linux_key
			end
		end
		if @found_key.nil?
				puts "\nThat name was not found.\n"
				puts "Please try again or choose a different name."
			else
				puts "\n\n"
				@found_key.detail_view
		end
	end

	def self.search_by_key(key_to_find)
		self.all.each do |key|
			if key.key_seq == key_to_find
				@found_key = key
			end
		end
		if @found_key.nil?
				puts "\nThat name was not found.\n"
				puts "Please try again or choose a different key."
			else
				puts "\n\n"
				@found_key.detail_view
		end
	end

	def self.search_by_number


	end
end
