class SessionsController < ApplicationController

  def new
    
  end

  def create
    user = User.find_by_email params[:session][:email].downcase
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome =)"
      redirect_to users_path(user)
    else
      flash.now[:danger] = "Sorry, wrong info =("  
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash.now[:success] = "Welcome =)"
    redirect_to root_path  
  end

end