class Module
	attr_accessor :name, :tool

	@@all = []
	@@commands = []

	def initialize(name, tool_name)
		@name = name
		@tool_name = tool
		@@all << self
	end

	def create_if_none(tool_name, module_name)
		@@all.detect {|instance| module_name == instance.name}
		#tool_name
	end

	def add_command(command)
		@@commands << command
	end

	def self.commands
		@@commands
	end

	def self.all
		@@all
	end


end
