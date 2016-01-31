class UsersController < ApplicationController

	before_filter :find_user

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

	def edit
		find_user
	end

	def update
		if @user.update(user_params)
			flash[:success] = "Your account was updated"
			redirect_to articles_path
		else
			render 'edit'
		end
	end


	private

	def user_params
		params.require(:user).permit(:username, :email, :password)		
	end

	def find_user
		@user = User.find(params[:id]) if params[:id]
	end
end