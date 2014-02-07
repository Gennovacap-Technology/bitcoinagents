class Dashboard::UsersController < ApplicationController

	before_filter :authenticate_user!
	load_and_authorize_resource

	def index
	end

	def show
	end

	def edit
		@user ||= User.find(current_user.id)
	end

	def update
		# Update the user
	end

end