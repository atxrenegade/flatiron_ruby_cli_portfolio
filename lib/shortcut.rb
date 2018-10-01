class Shortcut

	attr_accessor :name, :description, :mac, :linux, :windows
	def initialize(name)
		@name = name
	end


	def new_from_data_array(data_array)
		#["Preferences/Settings", "cmd-,", "ctrl-,", "ctrl-,", "Opens the Preferences/Settings view"]
		name = data_array[0]
		mac_key_seq = data_array[1]
		windows_key_seq = data_array[2]
		linux_key_seq = data_array[3]
		description_string = data_array[4]
		mac_key = MacOSKey.new(mac_key_seq)
		windows_key = WindowsKey.new(windows_key_seq)
		linux_key = LinuxKey.new(linux_key_seq)
		description = Description.new(description_string)
		shortcut = Shortcut.new(name, mac_key, windows_key, linux_key, description)

	end






	end

	def find_by_name

	end

	def all

	end
end

def self.new_from_data_array(tool_name, module_name, data_array)
	#git_init = Command.new_from_data_array("Git Hub", "Git Repository", [".git_init", "initiate git repository", nil])
	name = data_array[0]
	function = data_array[1]
	if data_array[2] != nil
		details = data_array[2]
	else
		details = nil
	end
	command = Command.create_command(module_name, name, function, details)
	binding.pry
	#tested and working above this line
	new_module = Module.create_if_none(tool_name, module_name)
	command.module = module_name
	new_module.add_command(self)
	command
end
