class Command
attr_accessor :command_name, :function, :details

    @@all = []

    def initialize(module, name, function, details= nil)
		@module = module
        @name = name
        @function = function
        @details = details
        @@all << self
    end

	def new_from_node(tool, data_array)
        command_name = data_array[1]
        function = data_array[2]
        if data_array[3] != nil
            @description = data_array[3]
        else
            @description = nil
        end
        node = ToolNode.new(data_array[0])
        command = Command.new(module, name, function, details)
    end

	def self.search_for_command(name)
		all.detect {|command_to_search| command_to_search.command_name == name}
	end

	def self.all
        @@all
    end

=begin -----test, notes and data-------
		 git_init = Command.new("Start-up Commands", ".git init", "starts new repository")

		 git_commit = Command.new("Making Commits", ".git push origin master", "pushes file to master branch")

		Command.search_for_command(".git init")
		Command.all
=end
end
