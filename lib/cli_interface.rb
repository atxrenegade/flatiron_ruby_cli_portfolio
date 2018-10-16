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
			display_shortcuts
		else
			puts "  Your response was not understood.\n"
			puts "  Please try again.\n\n"
			main_menu
		end
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
		submenu_options
	end

	def submenu_options
		puts "\n\n\nPlease select an option from the Menu Below:
		\n"
		puts "To view DETAILS of a specific shortcut enter the number below \n"
		puts "To search shortcuts by NAME type 'N'"
		puts "To search shortcuts by KEY type 'K'"
		puts "To return to MAIN MENU type 'MM'"
		puts "To exit type 'X'"
		submenu_input
	end

	def submenu_input
		@user_input = gets.strip!
		puts "\n\n\n"
		if @user_input == "X" || @user_input == "x"
			exit
		elsif @user_input == "N" || @user_input == "n"
			find_by_name
		elsif @user_input == "K" || @user_input == "k"
			find_by_key
		elsif @user_input == "MM" || @user_input == "mm"
			main_menu
		elsif @user_input.integer?
			display_details
		else
			puts "Your response was not understood.\n"
			puts "Please select a valid option.\n\n\n"
			submenu_options
		end
		puts "\n\n\n"
		submenu_options
	end

	def exit
		puts "\nThanks for using the Atom Shortcuts!"
		puts "  See you again soon!\n"
	end
end
