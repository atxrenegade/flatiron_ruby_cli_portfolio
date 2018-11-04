class Shortcut
	@@all = []

	attr_accessor :name, :description, :mac_key, :linux_key, :windows_key
	attr_reader :operating_system

	def initialize(name, description, mac_key, windows_key, linux_key )
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

end
