class CLIInterface

	def call
		Scraper.new.scrape_atom
		welcome_greeting
	end

	def welcome_greeting
		puts "\n\n\n****** Welcome To - Atom Shortcuts Quick Reference ******\n\n"
		puts "  This is a cli utility gem designed as a quick reference\n"
		puts "  to Atoms many shortcuts. With so many languages, commands,\n"
		puts "  shortcuts and tools to memorize, you can now access a quick\n"
		puts "  digital reference without having to interrupt your workflow.\n"
		puts "  Being familiar with important shortcuts and commands speeds\n"
		puts "  up your workflow and increases your productivity as a programmer.\n"
		puts "\n\nPress the ENTER key to continue....."

		any_key = gets
		if any_key.include?("\n")
			main_menu_display
		end
	end

	def main_menu_display
		puts"\n*********************************\n"
		puts "**********  MAIN MENU  **********\n"
		puts "*********************************\n\n"
		puts "Please Select Your Operating System\n"
		puts "or type 'X' to exit."

		puts "1. Mac OS\n"
		puts "2. Windows\n"
		puts "3. Linux\n"
		puts "X. EXIT\n\n"
		main_menu_input
	end

	def main_menu_input
		@user_os = gets.strip.upcase
		if @user_os == "X"
			exit_method
		elsif @user_os == "1" || @user_os =="2" || @user_os =="3"
			set_os
			submenu_display
		else
			CLIInterface.not_found
			main_menu_display
		end
	end

	def submenu_display
		puts "\nPlease select an option from the Menu Below:\n"
		puts "To LIST ALL shortcuts for your operating system type 'L'"
		puts "To search shortcuts by NAME type 'N'"
		puts "To search shortcuts by KEY type 'K'"
		puts "To return to MAIN MENU type 'MM'"
		puts "To EXIT type 'X'"
		puts "\nEnter your Selection:"
		submenu_input
	end

	def submenu_input
		@user_input = gets.strip.upcase
		puts "\n"
		if @user_input == "L"
			list_shortcuts
			details_menu_display
		elsif @user_input == "X"
			exit_method
		elsif @user_input == "N"
			search_by_os_and_name
		elsif @user_input == "K"
			search_by_os_and_key
		elsif @user_input == "MM"
			main_menu_display
		else
			CLIInterface.not_found
			submenu_display
		end
		puts "\n"
		submenu_display
	end

	def set_os
		if @user_os == "1"
			@os = OperatingSystem.find_by_name("Mac")
		elsif
			@user_os == "2"
			@os = OperatingSystem.find_by_name("Windows")
		else
			@os = OperatingSystem.find_by_name("Linux")
		end
	end

	def list_shortcuts
		puts "\n*************************************"
		puts "\n  ATOM SHORTCUTS FOR #{@os.name} OS"
		puts "\n*************************************\n\n"
		@os.sort_alphabetically
		@os.shortcuts.each_with_index do |shortcut, index|
			if (index)%10 == 0 && (index) != 0
				puts "\n (Press Enter to Continue)\n\n"
				gets
			end
			puts "  #{index + 1}.  #{shortcut.name}: #{shortcut.key_seq} \n"
		end
		puts "\n\n"
	end

	def search_by_os_and_name
		puts "Enter the shortcut name you would like to search for: \n"
		puts "(Use the format 'find in project')"
		name = gets.strip.downcase
		@os.search_by_name(name)
	end

	def search_by_os_and_key
		puts "Enter the key you would like to search for: \n"
		puts "(Use the format 'CTRL-K')\n"
		key_to_find = gets.strip.upcase
		@os.search_by_key(key_to_find)
	end

	def details_menu_display
		puts "To view DETAILS of a specific shortcut enter the number below \n"
		puts "To return to SEARCH MENU type 'SM'"
		puts "To return to MAIN MENU type 'MM'\n"
		puts "To EXIT type 'X'"
		details_menu_input
	end

	def details_menu_input
		details_input = gets.strip.upcase
		if details_input == 'SM'
			submenu_display
		elsif details_input == 'MM'
			main_menu_display
		elsif details_input == 'X'
			exit_method
		elsif is_integer?(details_input)
			@os.search_by_number(details_input)
		else
			CLIInterface.not_found
		end
		puts "\n"
		details_menu_display
	end

	def is_integer?(details_input)
		details_input.to_i.to_s == details_input
	end

	def exit_method
		puts "\nThanks for using the Atom Shortcuts!"
		puts "See you again soon!\n\n\n"
		exit
	end

	def self.detail_view(key)
		puts "\n\n   Shortcut Key Sequence: #{key.key_seq}\n"
		puts "   Shortcut Name: #{key.name}\n"
		puts "   Operating System: #{key.operating_system.name}\n"
		puts "   Shortcut Description: #{key.description}\n\n"
	end

	def self.not_found
		puts "\nYour response was not found or not understood.\n"
		puts "Please select a valid option.\n"
	end
end
