class module
	attr_accessor :name, :tool
	@@all = []
	@@commands = []

	def initialize(name, tool)
		@name name
		@tool = tool
		@@all << self
	end

	def create_if_none(name)

	end

	def self.commands
		@@commands
	end

	def self.all
		@@all
	end
end






end
