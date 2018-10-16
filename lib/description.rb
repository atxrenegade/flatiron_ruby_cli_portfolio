class Description
	@@all = []

	attr_accessor :details, :shortcut

	def initialize(details)
		@details = details
		self.save
	end

	def save
		@@all << self
	end
end
