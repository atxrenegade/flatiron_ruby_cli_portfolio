class Shortcut
	@@all

	attr_accessor :name, :description, :mac_key, :linux_key, :windows_key

	def initialize(name, description=nil, mac_key=nil, windows_key=nil, linux_key=nil )
		@name = name
		self.description if description
		self.mac_key if mac_key
		self.windows_key if windows_key
		self.linux_key if linux_key
	end
	
	def create_from_attribute_hash(attribute_hash)
		binding.pry
		#["Preferences/Settings", "cmd-,", "ctrl-,", "ctrl-,", "Opens the Preferences/Settings view"]

		mac_key = MacOSKey.new(attribute_hash[:mac_key])
		windows_key = WindowsKey.new(attribute_hash[:windows_key])
		linux_key = LinuxKey.new(attribute_hash[:linux_key])
		description = Description.new(attribute_hash[:description])
		shortcut = Shortcut.new(attribute_hash[:name], description, mac_key, windows_key, linux_key, description)
		shortcut.save
		shortcut
	end

	def save
		@@all << self
	end

	def all
		@@all
	end

	def find_by_name

	end

	def list_all

	end

end
