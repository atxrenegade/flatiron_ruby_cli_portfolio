#displays results by listing all or results of search

class DisplayObjects
	def initialize(data_hash)
	end
 	#what does the data look like coming from Scraper?
	#Output will include 2-5 of the following details :title, :command (or key sequence), :function, :details (only on some commands not on shortcuts, #these will include index numbers to access these details)
	def output_data(tool)
		puts "******************************************************\n"
		puts "\t\t\t#{tool.upcase}\n"
		puts "******************************************************\n\n"
		puts shortcut_command_hash.each do | category |
			if heading != nil
				puts "\t#{heading.upcase}"
			end
		end
	end
end
