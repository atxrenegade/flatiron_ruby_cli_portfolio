class WindowsKey
	@@all = []
	attr_accessor :description, :shortcut, :key_seq

	include Helper::InstanceMethods
	extend Searchable::ClassMethods


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
		puts "\tOperating System: WINDOWS OS\n"
		puts "\tShortcut Description: #{self.description}\n"
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
				input = gets
			end
			puts "  #{counter + 1}.  #{key.key_seq}: #{key.shortcut.name}\n"
			counter += 1
		end
	end
end
