class WindowsKey
	@@all = []
	attr_accessor :description, :shortcut, :key_seq

	extend Searchable::ClassMethods

	def initialize(key_seq)
		@key_seq = key_seq
		self.save
	end

	def save
		@@all << self
	end

	def detail_view
		puts "\n   Shortcut Key Sequence: #{self.key_seq}\n"
		puts "   Shortcut Name: #{self.shortcut.name}\n"
		puts "   Operating System: WINDOWS OS\n"
		puts "   Shortcut Description: #{self.description}\n"
	end

	def description
		self.shortcut.description.details
	end

	def self.all
		@@all
	end

	def self.list_all_by_key
		puts "\n*************************************"
		puts "\n  WINDOWS SHORTCUTS FOR MAC OS"
		puts "\n*************************************\n\n"
		counter = 0


		self.all.each do |key|
			if (counter)%10 == 0 && (counter) != 0
				puts "\n (Press Enter to Continue)\n\n"
				gets
			end
			puts "  #{counter + 1}.  #{key.key_seq}: #{key.shortcut.name}\n"
			counter += 1
			#added to correct bug - continuous looping through keys.all for multiple iterations
			break if counter == 46
		end
	end
end
