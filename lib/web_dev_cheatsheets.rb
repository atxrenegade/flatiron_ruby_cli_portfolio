require "web_dev_cheatsheets/version"



	class CLI_interface
		def initialize
			welcome
		end

		def welcome
			puts "\n\n\t\t\tWELCOME TO THE\n ******  LAZY PROGRAMMER's Shortcuts and Cheatsheets  ******\n\n"

			puts "Shortcuts and Cheatsheets is a cli utility gem designed\n"
			puts "as a quick reference to a web developer’s most commonly\n"
			puts "used tools. Think of it as a Swiss army knife for web developers\n"
			puts "and web dev students. With so many languages, commands, shortcuts\n"
			puts "and tools to memorize, you can now access a quick digital\n"
			puts "reference without having shuffle through pages of cheatsheets,\n"
			puts "or drown in stack overflow posts.\n\n"
			puts "Being familiar with shortcuts and important commands speeds up\n"
			puts  "your workflow and increases your productivity as a programmer.\n"
			puts "This program does not to include an exhaustive list of all\n"
			puts "available commands but focuses on the most commonly used\n"
			puts "shortcuts and commands you will need as a developer.\n\n"
			puts "\n\nPress any key to continue....."
			any_key = gets
			if any_key.include?("/n")
				main_menu #why is this line not executing
			end
		end

		def main_menu
			puts"\n\n*********************************\n"
			puts "**********  MAIN MENU  **********\n"
			puts "*********************************\n\n"
			puts "1. Shortcut of the Day\n2. Github commands\n3. Atom shortcuts\n"
			puts "4. Pry commands\n5. Bash/Shell (CLI for linux and UNIX)\n"
			puts "6. COMMAND (CLI for windows)\n7. Mac OS keyboard shortcuts\n"
			puts "8. Windows keyboard shortcuts\nX. EXIT\n"
			puts "Please select the number for the command you would like to execute?"
			input = gets.strip!

		end
	end
