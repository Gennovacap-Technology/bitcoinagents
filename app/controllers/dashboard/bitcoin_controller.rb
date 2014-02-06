class Dashboard::BitcoinController < ApplicationController

	before_filter :authenticate_user!
	load_and_authorize_resource

	def show
	end

	def buybitcoin
	end

	def sellbitcoin
	end

end