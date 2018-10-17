module Helper
	module InstanceMethods
		def description
			self.shortcut.description.details
		end
	end
end
