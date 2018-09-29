#cli_interface.rb formerly web_dev_cheatsheets
# will this name change cause issues at
class Greeting
	def initialize
		welcome
	end

	def welcome
		#can this be in the executable and removed from the class since it's a one off?
		puts "\n\n\t\t\tWELCOME TO THE\n ******  LAZY PROGRAMMER's Shortcuts and Ruby Reference  ******\n\n"

		puts "  Shortcuts and Cheatsheets is a cli utility gem designed\n"
		puts "  as a quick reference some common tools used by Ruby Developers.\n"
		puts " With so many languages, commands, shortcuts\n"
		puts "  and tools to memorize, you can now access a quick digital\n"
		puts "  reference without having shuffle through pages of cheatsheets,\n"
		puts "  or drown in Stack Overflow and Reedit posts.\n\n"
		puts "  Being familiar with shortcuts and important commands speeds up\n"
		puts "  your workflow and increases your productivity as a programmer.\n"
		puts "  This program does not to include an exhaustive list of all\n"
		puts "  available commands but focuses on the most commonly used\n"
		puts "  methods and Bash and Atom commands you will need as a developer.\n\n"
		puts "\n\n  Press the ENTER key to continue....."
		any_key = gets
		if any_key.include?("\n")
			Menu.new
		end
	end

	def exit
		puts "\n  Thanks for using the LAZY PROGRAMMER's shortcuts and cheatsheets!"
		puts "  See you again soon!\n"
	end
end

class Menu
	def initialize
		main_menu
	end

	def main_menu
		puts"\n*********************************\n"
		puts "**********  MAIN MENU  **********\n"
		puts "*********************************\n\n"
		puts "1. Atom SHORTCUTS\n"
		puts "2.Bash/Shell COMMANDS (CLI for linux and UNIX)\n"
		puts "3. Common Ruby Methods\n"
		puts "X. EXIT\n\n"
		puts "  Please select the number for the command you would\n  like to execute?\n\t"
		input = gets.strip!
		if input == "X" || input == "x"
			exit
		elsif input == "1" || input =="2" || input=="3"
			Scraper.new(input.to_i)
		else
			puts "  Your response was not understood.\n"
			puts "  Please try again\n\n"
			main_menu
		end
	end
end
