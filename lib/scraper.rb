
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

	def scrape_ruby

	end
	def scrape_bash

	end

	def scrape_atom
		binding.pry
		atom_doc = Nokogiri::HTML(open("https://github.com/nwinkler/atom-keyboard-shortcuts"))
		binding.pry
		#data_string = github_doc.css("html body div.container-fluid div.yo-row div#content table.box tbody")
		#FormatData.new(github, data_array)
	end
end
