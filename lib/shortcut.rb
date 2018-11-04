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
		#create new shortcut with these attributes and add
		shortcut = Shortcut.new(attribute_array)
		binding.pry

		#find_or_create_operating_system
		if !shortcut.mac_key.nil?
			mac_os = find_or_create_operating_system
			mac_os.add_key
		end

		if !shortcut.windows_key.nil?
			windows_os = find_or_create_operating_system
			windows.add_key
		end

		if !shortcut.linux_key.nil?
			linux_os = find_or_create_operating_system
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
