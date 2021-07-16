require "rubygems"
require "nokogiri"
require "open-uri"

def recuper_url
	#get html 
	doc = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))

	# get the names
	list = doc.css('a.cmc-table__column-name--symbol').map { |symbol| symbol.text  }
	
	#get the price
	cash_list = doc.xpath('//tr/td[5]/div/a').map { |cash| cash.text  }
	
	#join everything
	result = Hash.new
	#result[list ] = cash_list
	list.zip(cash_list) { |list,cash_list| result[list.to_sym] = cash_list }
	puts result
end

recuper_url













































