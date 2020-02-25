class FollowersController < ApplicationController
	def index
	end
	def show
		@user = User.find(params[:user_id])
		@followers = @user.followers
		@book = Book.new
	end
end
