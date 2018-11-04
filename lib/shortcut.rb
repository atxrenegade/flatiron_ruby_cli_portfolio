class Shortcut
	@@all = []

	attr_accessor :name, :description, :mac_key, :linux_key, :windows_key
	attr_reader :operating_system

	def initialize(name, mac_key, windows_key, linux_key, description)
		@name = name
		@mac_key = mac_key
		@windows_key = windows_key
		@linux_key = linux_key
		@description = description
	end

	def self.create_from_attribute_array(attribute_array)
		name = attribute_array[0]
		mac_key = attribute_array[1]
		windows_key = attribute_array[2]
		linux_key = attribute_array[3]
		description = attribute_array[4]
		shortcut = Shortcut.new(name, mac_key, windows_key, linux_key, description)
		binding.pry

		#find_or_create_operating_system
		if !shortcut.mac_key.nil?
			mac_os = find_or_create_operating_system(mac_os)
			mac_os.add_key
		end

		if !shortcut.windows_key.nil?
			windows_os = find_or_create_operating_system(windows_os)
			windows.add_key
		end

		if !shortcut.linux_key.nil?
			linux_os = find_or_create_operating_system(linux_os)
			linux.add_key
		end

		shortcut.save
	end

	def save
		@@all << self
	end

	def self.all
		@@all
	end

end
