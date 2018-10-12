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
		description = Description.new(attribute_hash[:description])

		shortcut = Shortcut.new(attribute_hash[:command_name], description, mac_key, windows_key, linux_key)
		#why is this not happening in the initalize method?
		#why do I need to use a class method to create these instances?

		shortcut.add_description(description) #to be tested?
		shortcut.add_mac_key(mac_key)
		shortcut.add_windows_key(windows_key)
		shortcut.add_linux_key(linux_key)

		shortcut.save

		#create object reciprocity for windows, linux, mac and descriptions
		#how do I call #create_from_attribute_hash from another class without having to use initialize
		binding.pry
	end

	def add_description(description)
		shortcut.description = self unless shortcut.description == self
	end
	def add_mac_key(mac_key)
		shortcut.mac_key = self unless shortcut.mac_key == self
	end
	def add_windows_key(windows_key)
		shortcut.windows_key = self unless shortcut.windows_key == self
	end
	def add_linux_key(linux_key)
		shortcut.linux_key = self unless shortcut.linux_key == self
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
