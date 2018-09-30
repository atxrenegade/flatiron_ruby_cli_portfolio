#cli_interface.rb formerly web_dev_cheatsheets
# will this name change cause issues at
class Greeting
	def initialize
		welcome
	end

	def welcome
		#can this be in the executable and removed from the class since it's a one off?
		puts "\n\n\t\t\tWELCOME TO THE\n ******  Atom Shortcuts Quick Reference  ******\n\n"

		puts "  This is a cli utility gem designed as a quick reference\n"
		puts "  to Atoms many shortcuts. With so\n"
		puts "  many languages, commands, shortcuts and tools to memorize,\n"
		puts "  you can now access a quick digital reference without having to interrupt your workflow.\n\n"
		puts "  Being familiar with shortcuts and important commands speeds\n"
		puts "  up your workflow and increases your productivity as a programmer.\n"
		puts "\n\nPress the ENTER key to continue....."

		any_key = gets
		if any_key.include?("\n")
			Menu.new
		end
	end

	def exit
		puts "\n  Thanks for using the Atom Shortcuts!"
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

		puts "1. Mac OS\n"
		puts "2. Windows\n"
		puts "3. Linux\n"
		puts "X. EXIT\n\n"
		puts "  Please select the number for the command you would\n  like to execute?\n\t"
		@user_os = gets.strip!
		if @user_os == "X" || input == "x"
			exit
		elsif @user_os == "1" || input =="2" || input=="3"
			Scraper.new
		else
			puts "  Your response was not understood.\n"
			puts "  Please try again.\n\n"
			main_menu
		end
	end
end
