require 'open-uri'

class CryptoPrice

	def initialize(coin)

		@coin = coin

	end


	def perform
		
		@page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/")) 

		@name_list = @page.css('a.currency-name-container') 
		@price_list = @page.css('a.price') 


		@ind = @name_list.index(@coin)
		@coin_price = @price_list[@ind]

		puts @coin_price

	end

end