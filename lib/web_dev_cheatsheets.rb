require "web_dev_cheatsheets/version"

	class CLI_interface
		def initialize
			welcome
		end

		def welcome
			puts "\n\n\t\t\tWELCOME TO THE\n ******  LAZY PROGRAMMER's Shortcuts and Cheatsheets  ******\n\n"

			puts "  Shortcuts and Cheatsheets is a cli utility gem designed\n"
			puts "  as a quick reference to a web developer’s most commonly\n"
			puts "  used tools. Think of it as a Swiss army knife for web developers\n"
			puts "  and web dev students. With so many languages, commands, shortcuts\n"
			puts "  and tools to memorize, you can now access a quick digital\n"
			puts "  reference without having shuffle through pages of cheatsheets,\n"
			puts "  or drown in stack overflow posts.\n\n"
			puts "  Being familiar with shortcuts and important commands speeds up\n"
			puts "  your workflow and increases your productivity as a programmer.\n"
			puts "  This program does not to include an exhaustive list of all\n"
			puts "  available commands but focuses on the most commonly used\n"
			puts "  shortcuts and commands you will need as a developer.\n\n"
			puts "\n\n  Press any key to continue....."
			any_key = gets
			if any_key.include?("\n")
				main_menu 
			end
		end

		def main_menu
			puts"\n*********************************\n"
			puts "**********  MAIN MENU  **********\n"
			puts "*********************************\n\n"
			puts "  1. Shortcut of the Day\n  2. Github COMMANDS \n  3. Atom SHORTCUTS\n"
			puts "  4. Pry COMMANDS\n  5. Bash/Shell COMMANDS (CLI for linux and UNIX)\n"
			puts "  6. COMMAND (CLI for windows)\n  7. Mac OS keyboard SHORTCUTS\n"
			puts "  8. Windows keyboard SHORTCUTS\n  X. EXIT\n\n"
			puts "  Please select the number for the command you would\n  like to execute?\n\t"
			input = gets.strip!
			if input == "X" || input == "x"
				exit
			elsif input == "1"
				Shortcut_of_the_Day.new
			else
				Scaper.new(input)
			end
		end

		def submenu_A
		end

		def submenu_B
		end

		def exit
			puts "\n  Thanks for using the LAZY PROGRAMMER's shortcuts and cheatsheets!"
			puts "  See you again soon!\n"
		end
	end

	class Scraper
		def initialize(user_selection)
			@user_selection = user_selection
		end
	end

	class Shortcut_of_the_Day

	end

	class Shortcuts
	end

	class Commands
	end
