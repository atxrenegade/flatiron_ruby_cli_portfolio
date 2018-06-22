class Tool
	attr_accessor :name, :module_name
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

	def self.create(name)
		tool = Tool.new(name)
		tool.save
		tool
	end

	def self.all
		@@all
	end

	def add_module(module_name)
		module_name.tool.nil? ? module_name.tool = self : module_name.tool
		if !(modules.include?(module_name))
		 	modules << module_name
		end
	end
end
