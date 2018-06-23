class Command
	#how and when do I tell modules and commands about each_other?
attr_accessor :module_name, :name, :function, :details
attr_reader :tool

    @@all = []

    def initialize(module_name, name, function, details= nil)
		@module_name = module_name
        @name = name
        @function = function
        @details = details
    end

	def create_command(module_name, name, function, details)
		command = Command.new(module_name, name, function, details)
		command.save #not saving
		command.module = module_name
	end

	#to_be_tested
	#not working "error: wrong number of arguments"
	def new_from_data_array(tool_name, module_name, data_array)
		#NoMethodError: undefined method `new_from_data_array' for Command:Class
        name = data_array[0]
        function = data_array[1]
        if data_array[2] != nil
            details = data_array[2]
        else
            details = nil
        end
		command = Command.create_command(module_name, name, function, details)
		binding.pry
		new_module = Module.create_if_none(tool_name, module_name)
		command.module = module_name
		new_module.add_command(self)
		command.save
		command
    end

	def self.search_for_command(name)
		all.detect {|command_to_search| command_to_search.name == name}
	end

	def self.all
        @@all
    end

	def save
		@@all << self
	end

	def module=(module_name)
		@module = module_name
		module_name.add_command(self)
	end

	#do I need this method?
	def tool=(tool)
		@tool = tool
	end

=begin -----test, notes and data-------
example of command format
		 git_init = Command.new("Start-up Commands", ".git init", "starts new repository")

		 git_commit = Command.new("Making Commits", ".git push origin master", "pushes file to master branch")

		Command.search_for_command(".git init")
		Command.all
=end
end
