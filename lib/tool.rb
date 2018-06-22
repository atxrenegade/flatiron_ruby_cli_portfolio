class Tool
	attr_accessor :name
	attr_reader :commands, :modules

 	@@all = []

	def initialize(name)
		@name = name
		@modules = []
	end

	def modules
		self.modules
	end

	def commands
		self.modules.collect {|commands| modules.commands}
	end

	def self.find_or_create(name)
		if tool.name == nil
			new_tool = Tool.new(name)
		else
			tool.all {||}
		end
	end

	def self.all
		@@all
	end
end
















end
