class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			flash[:success] = "Welcom #{@user.username}"
			redirect_to articles_path
		else
			render 'new'
		end
	end

	private

	def user_params
		params.require(:user).permit(:username, :email, :password)		
	end

	def find_user
		@model = Users.find(params[:id]) if params[:id]
	end
end