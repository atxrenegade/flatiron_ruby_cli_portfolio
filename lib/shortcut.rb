class Shortcut
	@@all = []

	attr_accessor :name, :description, :mac_key, :linux_key, :windows_key

	def initialize(name, description=nil, mac_key=nil, windows_key=nil, linux_key=nil )
		@name = name
		self.description if description
		self.mac_key if mac_key
		self.windows_key if windows_key
		self.linux_key if linux_key
	end

	def self.create_from_attribute_hash(attribute_hash)
		mac_key = MacOSKey.new(attribute_hash[:mac_key])
		windows_key = WindowsKey.new(attribute_hash[:windows_key])
		linux_key = LinuxKey.new(attribute_hash[:linux_key])
		description = ShortcutDescription.new(attribute_hash[:description])

		shortcut = Shortcut.new(attribute_hash[:command_name], description, mac_key, windows_key, linux_key)
		shortcut.save
		#create object reciprocity for windows, linux, mac and descriptions
		#how do I call #create_from_attribute_hash from another class without having to use initialize
		binding.pry
	end

	def save
		@@all << self
	end

	def self.all
		@@all
	end

	def find_by_name

	end

	def list_all

	end

end
