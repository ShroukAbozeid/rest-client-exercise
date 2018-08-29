require 'rest-client'

class Search

	def self.get_query
		puts "What do you want to search for ?"
		q = gets.chomp
		q.gsub(/\s+/,'+')
	end
	
	def self.display_response(r)
		puts "Status Code: #{r.code}\n"
		puts "Headers : #{r.headers}\n "
		puts "Cookies : #{r.cookies}\n"
		puts "display body ? y/n"
		choice = gets.chomp
		puts "Body :\n #{r.body}" if choice == 'y'
	end

	def self.bing_search
		q = get_query
		url = "https://bing.com"
		params = {"q":q}
		response = RestClient.get url,{params: params}
		display_response(response)
	end
end

Search.bing_search


