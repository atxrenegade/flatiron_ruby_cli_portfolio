class Shortcut
	@@all = []

	attr_accessor :name
	attr_reader :description, :mac_key, :linux_key, :windows_key

	def initialize(name, description=nil, mac_key=nil, windows_key=nil, linux_key=nil )
		@name = name
		@description if description
		@mac_key if mac_key
		@windows_key if windows_key
		@linux_key if linux_key
	end

	def add_description(description)
		#binding.pry
		@description = description
		#create reciprocity here
		Description.add_shortcut(self) unless Description.shortcut == self
	end

	def add_mac_key(mac_key)
		@mac_key = mac_key
		MacOSKey.add_shortcut(self) unless MacOSKey.shortcut == self
	end

	def add_windows_key(windows_key)
		@windows_key = windows_key
		WindowsKey.add_shortcut(self) unless WindowsKey.shortcut == self

	end

	def add_linux_key(linux_key)
		@linux_key = linux_key
		LinuxKey.add_shortcut(self) unless LinuxKey.shortcut == self
	end

###this should NOT BE A CLASS METHODS It SHOULD BE INSTANCE METHOD
	def self.create_from_attribute_hash(attribute_hash)
		mac_key = MacOSKey.new(attribute_hash[:mac_key])
		windows_key = WindowsKey.new(attribute_hash[:windows_key])
		linux_key = LinuxKey.new(attribute_hash[:linux_key])
		description = Description.new(attribute_hash[:description])

		shortcut = Shortcut.new(attribute_hash[:command_name], description, mac_key, windows_key, linux_key)
		#why is this not happening in the initalize method?
		#why do I need to use a class method to create these instances?

		binding.pry
		shortcut.add_description(description) #to be tested?
		shortcut.add_mac_key(mac_key)
		shortcut.add_windows_key(windows_key)
		shortcut.add_linux_key(linux_key)

		shortcut.save

		#create object reciprocity for windows, linux, mac and descriptions
		#how do I call #create_from_attribute_hash from another class without having to use initialize or a class method
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
