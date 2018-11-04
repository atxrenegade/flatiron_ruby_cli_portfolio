class Scraper

	ATOM_PATH = "https://github.com/nwinkler/atom-keyboard-shortcuts"

	def scrape_atom
		atom_doc = Nokogiri::HTML(open(ATOM_PATH))
		binding.pry
		shortcut_string = atom_doc.css("html body div div #js-repo-pjax-container div div #readme div article.markdown-body.entry-content table tbody").text
		DataFormatter.new.create_data_array_from_scraper(shortcut_string)
	end
end
