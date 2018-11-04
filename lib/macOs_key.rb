class MacOSKey
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
		puts "   Operating System: Mac OS\n"
		puts "   Shortcut Description: #{self.description}\n\n"
	end

	def description
		self.shortcut.description.details
	end

	def self.all
		@@all
	end

	def self.sort_alphabetically
		Shortcut.all.collect.sort_by {|obj| obj.name}
	end

	def self.list_shortcuts
		puts "\n*************************************"
		puts "\n  ATOM SHORTCUTS FOR #{self.name} OS"
		puts "\n*************************************\n\n"
		counter = 0
		#sorted_array = self.sort_alphabetically
		sorted_array.each_with_index do |shortcut|
			if (counter)%10 == 0 && (counter) != 0
				puts "\n (Press Enter to Continue)\n\n"
				gets
			end
			puts "  #{counter + 1}.  #{shortcut.name}: #{shortcut.windows_key.key_seq} \n"
			counter += 1
		end
	end
end
