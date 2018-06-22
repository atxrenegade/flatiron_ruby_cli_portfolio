class Tool
	attr_accessor :name, :module
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

	def add_module(module)
		module.tool.nil? ? module.tool = self : module.tool
		if !(modules.include?(module))
		 	modules << module
		end
	end
end
















end
