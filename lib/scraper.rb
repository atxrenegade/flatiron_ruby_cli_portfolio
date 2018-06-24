
class Scraper
	def initialize(user_input)
		@user_input = user_input
	end

	def selector
		case @user_input
		when 1.1
			puts "  Im choosing a random category from Mac/Linux OS relevant shortcuts and\n"
			puts "  and commands and scraping it for the random shortcut of the day!\n"
		when 1.2
			puts "  Im choosing a random category from WINDOWS OS relevant shortcuts and\n"
			puts "  and commands and scraping it for the random shortcut of the day!\n"
		when 1.3
			puts "  Im choosing a random category from ALL OF THE ABOVE relevant shortcuts and\n"
			puts "  and commands and scraping it for the random shortcut of the day!\n"
		when 2
			scrape_github
			#puts "  Scraping Github COMMANDS!\n"
		when 3
			puts "  Scraping Atom SHORTCUTS!\n"
		when 4
			puts "  Scraping Pry COMMANDS!\n"
		when 5
			puts "  Scraping Bash/Shell COMMANDS!\n"
		when 6
			puts "  Scraping COMMAND (CLI for WINDOWS!)\n"
		when 7
			puts "  Scraping Mac OS Keyboard SHORTCUTS!\n"
		when 8
			puts "  Scraping Windows Keyboard SHORTCUTS!\n"
		end
		puts "\n\n"
	end

	def scrape_github
		github_doc = Nokogiri::HTML(open("http://www.yolinux.com/TUTORIALS/Git-commands.html"))
		data_string = github_doc.css("html body div.container-fluid div.yo-row div#content table.box tbody")

 		#test github = Scraper.new("2").scrape_github

		FormatData.new(github, data_array)
	end
end
