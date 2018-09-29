
class Scraper
	def initialize(user_input)
		@user_input = user_input
	end

	def selector
		if @user_input == "1"
			puts "  Scraping Atom SHORTCUTS!\n"
			scrape_atom
		elsif @user_input == "2"
			puts "  Scraping Bash COMMANDS!\n"
			scrape_bash
		else
			puts "  Scraping Ruby METHODS!\n"
			scrape_atom
		end
	end

	def scrape_github#to be deleted
		github_doc = Nokogiri::HTML(open("http://www.yolinux.com/TUTORIALS/Git-commands.html"))
		data_string = github_doc.css("html body div.container-fluid div.yo-row div#content table.box tbody")

 		#test github = Scraper.new("2").scrape_github

		FormatData.new(github, data_array)
	end

	def scrape_ruby

	end

	def scrape_bash

	end

	def scrape_atom

	end
end
