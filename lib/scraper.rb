
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
		ruby_doc = Nokogiri::HTML(open(""))
		@ruby_string = atom_doc.css("").children.text
		@ruby_string.format_data

	end
	def scrape_bash

	end

	def scrape_atom
		if @shortcut_string == nil
			atom_doc = Nokogiri::HTML(open("https://github.com/nwinkler/atom-keyboard-shortcuts"))
			@shortcut_string = atom_doc.css("html body div div #js-repo-pjax-container div div #readme div article.markdown-body.entry-content table tbody").children.text
			binding.pry
			#@shortcut_string.format_data
		else
			#submenu list all or search shortcuts
		end
	end
end
