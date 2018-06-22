class Module
	attr_accessor :name, :tool

	@@all = []
	@@commands = []

	def initialize(name, tool)
		@name = name
		@tool = tool
		@@all << self
	end

	def create_if_none(name)
		@@all.detect {|instance| name == instance.name}
	end

	def add_command(command)
		@@command << command
	end

	def self.commands
		@@commands
	end

	def self.all
		@@all
	end
end
