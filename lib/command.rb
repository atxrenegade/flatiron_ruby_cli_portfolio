class Command
attr_accessor :command_name, :function, :description, :node

    @@all = []

    def initialize(node_name, command_name, function, description= nil)
		@node = node
        @command_name = command_name
        @function = function
        @description = description
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
        command = Command.new(node, command_name, function, description)
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
