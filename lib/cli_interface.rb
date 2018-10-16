class CLIInterface

	def initialize
		welcome
	end

	def welcome
		puts "\n\n\n****** Welcome To - Atom Shortcuts Quick Reference ******\n\n"
		puts "  This is a cli utility gem designed as a quick reference\n"
		puts "  to Atoms many shortcuts. With so many languages, commands,\n"
		puts "  shortcuts and tools to memorize, you can now access a quick\n"
		puts "  digital reference without having to interrupt your workflow.\n\n"
		puts "  Being familiar with important shortcuts and commands speeds\n"
		puts "  up your workflow and increases your productivity as a programmer.\n"
		puts "\n\nPress the ENTER key to continue....."

		any_key = gets
		if any_key.include?("\n")
			main_menu
		end
	end

	def main_menu
		puts"\n*********************************\n"
		puts "**********  MAIN MENU  **********\n"
		puts "*********************************\n\n"
		puts "Please Select Your Operating System\n"
		puts "or type 'X' to exit."

		puts "1. Mac OS\n"
		puts "2. Windows\n"
		puts "3. Linux\n"
		puts "X. EXIT\n\n"

		@user_os = gets.strip!
		if @user_os == "X" || @user_os == "x"
			exit
		elsif @user_os == "1" || @user_os =="2" || @user_os =="3"
			Scraper.new.scrape_atom
			submenu_options
		else
			puts "  Your response was not understood.\n"
			puts "  Please try again.\n\n"
			main_menu
		end
	end

	def submenu_options
		puts "\n\n\nPlease select an option from the Menu Below:
		\n"
		puts "To LIST ALL shortcuts for your operating system type 'L'"
		puts "To search shortcuts by NAME type 'N'"
		puts "To search shortcuts by KEY type 'K'"
		puts "To return to MAIN MENU type 'MM'"
		puts "To exit type 'X'"
		puts "\nEnter your Selection:"
		submenu_input
	end

	def submenu_input
		@user_input = gets.strip!
		puts "\n"

		if @user_input == "L" || @user_input == "l"
			display_shortcuts
		elseif @user_input == "X" || @user_input == "x"
			exit
		elsif @user_input == "N" || @user_input == "n"
			search_by_os_and_name
		elsif @user_input == "K" || @user_input == "k"
			search_by_os_and_key
		elsif @user_input == "MM" || @user_input == "mm"
			main_menu
		else
			puts "Your response was not understood.\n"
			puts "Please select a valid option.\n"
			submenu_options
		end
		puts "\n"
		submenu_options
	end

	def display_shortcuts
		if @user_os == "1"
			MacOSKey.list_all_by_key
		elsif
			@user_os == "2"
			WindowsKey.list_all_by_key
		else
			LinuxKey.list_all_by_key
		end
		puts "\n"
		details_menu
	end

	def search_by_os_and_name
		puts "Enter the shortcut name you would like to search for: \n"
		name = gets.strip!
		if @user_os == "1"
			MacOSKey.search_by_name(name)
		elsif @user_os == "2"
			WindowsKey.search_by_name(name)
		else
			LinuxKey.search_by_name(name)
		end
	end

	def search_by_os_and_key
		puts "Enter the key you would like to search for: \n"
		puts "(Use the format 'ctrl-key')\n"
		key_to_find = gets.strip!
		if @user_os == "1"
			MacOSKey.search_by_key(key_to_find)
		elsif @user_os == "2"
			WindowsKey.search_by_key(key_to_find)
		else
			LinuxKey.search_by_key(key_to_find)
		end
	end

	def details_menu
		puts "To view DETAILS of a specific shortcut enter the number below \n"
		puts "To return to Search Menu"
		puts "To return to Main Menu"
		@details_input = gets.strip!

	end
	def display_details
		if @user_os == "1"
			MacOSKey.search_by_number
		elsif @user_os == "2"
			WindowsKey.search_by_number
		else
			LinuxKey.search_by_number
		end
	end

	def exit
		#how do I terminate the program here?
		unless @user_input != 'x' || @user_input != 'X'
			puts "\nThanks for using the Atom Shortcuts!"
			puts "  See you again soon!\n"

		end
	end
end
