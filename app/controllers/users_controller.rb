class UsersController < ApplicationController
	before_action :authenticate_user!
	def show
		@user = User.find(params[:id])
		@books = @user.books.page(params[:page]).reverse_order
		@book = Book.new
		if @user == current_user
			gon.address = @user.address_city + @user.address_street + @user.address_building
		end
	end
	def index
		@user = User.new
		method = flash[:f_users]
		search = flash[:w_users]
		@users = User.search(method,search)
		@book = Book.new
		@books = Book.all
	end
	def update
		@user = User.find(params[:id])
    	if @user.update(user_params)
    		flash[:notice]="You have updated user successfully."
    		redirect_to user_path(@user)
    	else
    		flash[:notice]="error"
    		render :edit
    	end
	end
	def edit
		@user = User.find(params[:id])
		if @user==current_user
		else
			redirect_to user_path(current_user)
		end
	end
	private
	def user_params
    	params.require(:user).permit(:name, :profile_image, :introduction, :postcode, :prefecture_code, :address_city, :address_street, :address_building)
	end
end
