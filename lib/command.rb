class Command
attr_accessor :name, :function, :details, :module

    @@all = []

    def initialize(module, name, function, details= nil)
		@module = module
        @name = name
        @function = function
        @details = details
    end

	def create_command
		command = Command.new(name, function, details)
		self.save
		command.module = module
	end

	def command_formatter(module, data_array)
		self.module = module
        self.name = data_array[1]
        self.function = data_array[2]
        if data_array[3] != nil
            self.details = data_array[3]
        else
            self.details = nil
        end
    end

	def self.search_for_command(name)
		all.detect {|command_to_search| command_to_search.command_name == name}
	end

	def self.all
        @@all_all
    end

	def save
		@@all << self
	end

=begin -----test, notes and data-------
example of command format
		 git_init = Command.new("Start-up Commands", ".git init", "starts new repository")

		 git_commit = Command.new("Making Commits", ".git push origin master", "pushes file to master branch")

		Command.search_for_command(".git init")
		Command.all
=end
end
