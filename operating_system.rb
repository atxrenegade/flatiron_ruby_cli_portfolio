class OperatingSystem < ActiveRecord::Base

	attr_accessor :name, :shortcut

	def initialize(name)
		@name = name
		@shortcuts = []
	end

	def shortcuts
		@shortcuts
	end	

end
