class Scraper
	def initialize
	end

	def scrape_atom
		atom_doc = Nokogiri::HTML(open("https://github.com/nwinkler/atom-keyboard-shortcuts"))
		@shortcut_string = atom_doc.css("html body div div #js-repo-pjax-container div div #readme div article.markdown-body.entry-content table tbody").text
	end
end
