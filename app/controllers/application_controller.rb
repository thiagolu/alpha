class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?, :admin?

  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
  	!!current_user
  end

  def require_user
  	if !logged_in?
  		flash[:danger] = "Please Login"
  		redirect_to root_path
  	end
  end

  def require_same_user
    if current_user != @article.user
      flash[:danger] = "Not yours"
      redirect_to root_path
    end
  end

  def admin?
    if logged_in?
      is_admin?
    else
      redirect_to root_path  
    end
  end

  def is_admin?
    current_user.role == "admin"
  end
end
