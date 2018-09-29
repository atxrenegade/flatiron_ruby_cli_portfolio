
class Scraper
	def initialize(user_input)
		@user_input = user_input
		self.selector
	end

	def selector
		if @user_input == 1
			puts "  Scraping Atom SHORTCUTS!\n"
			scrape_atom
		elsif @user_input == 2
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
		if shortcut_string.empty?
			binding.pry
			atom_doc = Nokogiri::HTML(open("https://github.com/nwinkler/atom-keyboard-shortcuts"))
			shortcut_string = atom_doc.css("html body div div #js-repo-pjax-container div div #readme div article.markdown-body.entry-content table tbody").children.text

			format_data(shortcut_string)
		else
			#submenu list all or search shortcuts
		end	
	end
end
