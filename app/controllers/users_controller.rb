class UsersController < ApplicationController

	before_filter :find_user
	before_action :require_same_user, only: [:edit, :update]

	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			flash[:success] = "Welcom #{@user.username}"
			redirect_to root_path
		else
			render 'new'
		end
	end

	def destroy
		if @user.role == "admin" 
			@user.destroy
			flash[:danger] =  "Destroy"
			redirect_to users_path
		end
	end

	def show
		@user_articles = @user.articles.paginate(page: params[:page], per_page: 2)
	end

	def edit
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

	def require_same_user
		if current_user != @user
			flash[:danger]= "You can't do this"
			redirect_to root_path
		end
	end

  def admin?
    current_user.role == "admin"
  end

end