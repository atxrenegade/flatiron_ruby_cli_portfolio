class Scraper
	def initialize
	end

	def scrape_atom
		atom_doc = Nokogiri::HTML(open("https://github.com/nwinkler/atom-keyboard-shortcuts"))
		@shortcut_string = atom_doc.css("html body div div #js-repo-pjax-container div div #readme div article.markdown-body.entry-content table tbody").text
		binding.pry
		DataFormatter.new.create_data_array_from_scraper
		#call data_formatter data_array_from_scraper
	end
end
