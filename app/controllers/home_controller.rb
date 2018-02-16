class HomeController < ApplicationController

	def index

		@price=nil
		@currency=nil

		if params[:search]
			@currency = params_choice[:choice]
		end

		@currencies = CryptoPrice.new.cryptocurrencies 
		
		@price = CryptoPrice.new.perform(@currency)
	end

	private

	def params_choice
		params.require(:search).permit(:choice)
	end
end