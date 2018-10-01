class Shortcut
	@@all

	attr_accessor :name, :description, :mac_key, :linux_key, :windows_key

	def initialize(name, description, mac_key=nil, windows_key=nil, linux_key=nil )
		@name = name
		@description = description
		@mac_key = mac_key
		@windows_key = windows_key
		@linux_key = linux_key
	end


	def new_from_data_array(data_array)
		#["Preferences/Settings", "cmd-,", "ctrl-,", "ctrl-,", "Opens the Preferences/Settings view"]
		name = data_array[0]
		mac_key_seq = data_array[1]
		windows_key_seq = data_array[2]
		linux_key_seq = data_array[3]
		description_string = data_array[4]
		new_mac_key = MacOSKey.new(mac_key_seq)
		new_windows_key = WindowsKey.new(windows_key_seq)
		new_linux_key = LinuxKey.new(linux_key_seq)
		new_description = Description.new(description_string)
		shortcut = Shortcut.new(name, mac_key_seq, windows_key_seq, linux_key_seq, description_string)
		#create associations between new objects
	end

	def find_by_name

	end

	def all
		@@all
	end
end
