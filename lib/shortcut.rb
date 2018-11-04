class Shortcut
	@@all = []

	attr_accessor :name, :description, :mac_key, :linux_key, :windows_key
	attr_reader :operating_system

	def initialize(name, key_seq, description, operating_system)
		@name = name
		@key_seq = key_seq
		@description = description
		@operating_system = operating_system
	end

	def self.create_from_attribute_array(attribute_array)
		operating_system = OperatingSystem.new.find_or_create_operating_system(attribute_array[3])
		name = attribute_array[0]
		key_seq = attribute_array[1]
		description = attribute_array[2]

		@shortcut = Shortcut.new(name, key_seq, description, operating_system)

		@shortcut.save
	end

	def save
		@@all << self
	end

	def self.all
		@@all
	end

end
