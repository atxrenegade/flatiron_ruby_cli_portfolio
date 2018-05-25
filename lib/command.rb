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

	def self.all
        @@all
    end  
end
