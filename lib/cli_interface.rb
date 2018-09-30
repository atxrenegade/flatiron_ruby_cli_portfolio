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
			binding.pry
			Scraper.new
		else
			puts "  Your response was not understood.\n"
			puts "  Please try again.\n\n"
			main_menu
		end
	end
	def exit
		puts "\nThanks for using the Atom Shortcuts!"
		puts "  See you again soon!\n"
	end
end
