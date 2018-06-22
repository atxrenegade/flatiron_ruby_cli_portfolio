class module
	attr_accessor :name, :tool
	@@all = []
	
	def initialize(name, tool)
		@name = name
		@tool = tool
		@@all << self
	end






end
