class FollowsController < ApplicationController
	def index
	end
	def show
		@user = User.find(params[:user_id])
		@follows = @user.followings
		@book = Book.new
	end
end