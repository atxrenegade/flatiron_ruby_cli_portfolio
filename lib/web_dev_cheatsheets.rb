require "web_dev_cheatsheets/version"
require 'nokogiri'
require 'pry'

class Greeting
	def initialize
		welcome
	end

	def welcome
		#can this be in the executable and removed from the class since it's a one off?
		puts "\n\n\t\t\tWELCOME TO THE\n ******  LAZY PROGRAMMER's Shortcuts and Cheatsheets  ******\n\n"

		puts "  Shortcuts and Cheatsheets is a cli utility gem designed\n"
		puts "  as a quick reference to a web developer\’s most commonly\n"
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
			puts "  1. Shortcut of the Day\n  2. Github COMMANDS \n  3. Atom SHORTCUTS\n"
			puts "  4. Pry COMMANDS\n  5. Bash/Shell COMMANDS (CLI for linux and UNIX)\n"
			puts "  6. COMMAND (CLI for windows)\n  7. Mac OS keyboard SHORTCUTS\n"
			puts "  8. Windows keyboard SHORTCUTS\n  X. EXIT\n\n"
			puts "  Please select the number for the command you would\n  like to execute?\n\t"
			input = gets.strip!
			if input == "X" || input == "x"
				exit
			elsif input == "1"
				Daily_Shortcut.new
			else
				Scraper.new(input.to_i)
			end
		end
	end

	class Daily_Shortcut
		def initialize
			daily_shortcut_greeting
		end

		def daily_shortcut_greeting
			puts "\n  WELCOME TO SHORTCUTS!\n"
			puts "  This feature is designed to familiarize you with a\n"
			puts "  single randomly chosen shortcut. To make this the\n"
			puts "  most relevant to you can you tell me which operating\n"
			puts "  systems you are using?\n"
			daily_shortcut_submenu
		end

		def daily_shortcut_submenu
			puts "  1. Mac/Linux\n  2. Windows\n  3. All of the Above\n"
			puts "  MM. Main Menu\n  X. EXIT"
			user_input = gets.strip!
			user_input.to_f
			case user_input
			when "1"
				puts "  You chose Mac/Linux!"
				Scraper.new(1.1)
			when "2"
				puts "  You chose Windows!"
				Scraper.new(1.2)
			when "3"
				puts "  You chose all of the above!"
				Scraper.new(1.3)
			when "MM"
				Menu.new
			when "mm"
				Menu.new
			when "X"
				exit
				#TO DO fix exit function
				#how do i call these methods from other classes
				#without having to initialize a new class each time?
		 	when "x"
				exit
			else
				puts "  Your response was not understood.\n"
				puts "  Please try again\n\n"
				menus.daily_shortcut_submenu
			end
	end
end
