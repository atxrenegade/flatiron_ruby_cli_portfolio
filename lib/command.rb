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

	def self.all
        @@all
    end
end
