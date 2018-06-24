class DataFormatter
	def initialize(tool, data_array)
		@tool = tool
		@data_array = data_array
	end

	def type_switch
		case Tool_type
		when tool == "Git Hub"
			format_github(data_array)
		when tool == "Atom"
			format_atom(data_array)
		end
	end

	def format_github

	end

	def format_atom

	end
end
