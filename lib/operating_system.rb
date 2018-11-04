class OperatingSystem
	@@all = []

	attr_accessor :name, :shortcut

	def initialize(name= nil)
		@name = name
		@shortcuts = []
	end

	def shortcuts
		@shorcuts
	end

	def self.find_or_create_operating_system(name)
		os = OperatingSystem.all.detect {|os_object| name == os_object.name}
		if os.nil?
			create_operating_system(name)
		else
			os
		end
	end

	def self.create_operating_system(name)
		os = OperatingSystem.new(name)
		os.save
		os
	end

	def add_shortcut(shortcut)
		shortcut.operating_system = self
		@shortcuts << shortcut
	end

	def self.all
		@@all
	end

	def save
		@@all << self
	end
end
