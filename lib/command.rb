class Command
attr_accessor :name, :function, :details
attr_reader :module, :tool

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

	def self. new_from_data_array(module, data_array)
        name = data_array[1]
        function = data_array[2]
        if data_array[3] != nil
            details = data_array[3]
        else
            details = nil
        end
		command = Command.new(module, name, function, details)
		module = Module.create_if_new(module)
		command.save
		command.module = module
    end

	def self.new_from_filename(filename)
	new_artist, new_song, new_genre = filename.split(" - ")
	song = Song.new(new_song)
	artist = Artist.find_or_create_by_name(new_artist)
	genre = new_genre.gsub(".mp3","")
	genre = Genre.find_or_create_by_name(genre)
	song.artist = artist
	song.genre = genre
	song
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
