class WelcomeController < ApplicationController

	def index
		redirect_to articles_path if logged_in?		
	end
	
	def about
		
	end

	def header
		
	end

end