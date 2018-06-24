class DataFormatter
	def initialize(tool, data_array)
		@tool = tool
		@data_array = data_array
	end

	def type_switch
		case tool_type
		when tool == "Git Hub"
			format_github(data_array)
		else tool == "Atom"
			format_atom(data_array)
		#add future pages options here
		end
	end

	def format_github
		github = Tool.create("Git Hub")
		#how do i parse the array to create modules with commands,
		#functions, and details
	end

	def format_atom

	end
end
