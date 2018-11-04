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
		#create new shortcut with these attributes and add
		binding.pry
		shortcut = Shortcut.new(attribute_hash[:command_name], description, mac_key, windows_key, linux_key)

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
