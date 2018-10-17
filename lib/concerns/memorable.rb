module Memorable
	module InstanceMethods
		def save
			@@all << self
		end
	end

	module ClassMethods
		def all
			@@all
		end
	end
end		
