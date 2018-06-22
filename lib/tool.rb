class Tool
	attr_accessor :name
	attr_reader :commands, :modules

	@commands = []

	def initialize(name)
		@name = name
	end

	def modules
		module.all
	end

	end

	def commands
		@commands = modules.collect {|commands| modules.commands}
	end

	def self.find_or_create
	end

	def save
	end

	def self.find
	end

	def self.all
	end
end
















end
