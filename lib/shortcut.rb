class Shortcut
	@@all = []

	attr_accessor :name
	attr_reader :description, :mac_key, :linux_key, :windows_key

	def initialize(name, description=nil, mac_key=nil, windows_key=nil, linux_key=nil )
		@name = name
		@description = description
		@mac_key = mac_key
		@windows_key = windows_key
		@linux_key = linux_key
	end

	def self.create_from_attribute_hash(attribute_hash)

		mac_key = MacOSKey.new(attribute_hash[:mac_key])
		windows_key = WindowsKey.new(attribute_hash[:windows_key])
		linux_key = LinuxKey.new(attribute_hash[:linux_key])
		description = Description.new(attribute_hash[:description])

		shortcut = Shortcut.new(attribute_hash[:command_name], description, mac_key, windows_key, linux_key)

		description.shortcut = shortcut
		mac_key.shortcut = shortcut
		windows_key.shortcut = shortcut
		linux_key.shortcut = shortcut

		shortcut.save
	end

	def save
		@@all << self
	end

	def self.all
		@@all
	end

	def self.find_by_name(name)

	end

	def self.list_all_by_name
		@@all.sort_by_name
		#list and number each shortcut in alphabetical order by name
	end

	def self.sort_by_name
		#sort shortcuts_by_alphabetical_name

	end
end
