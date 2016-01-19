class ArticlesController < ApplicationController
	before_action :find_model, only: [ :show, :edit, :update, :destroy ]

	def index
		@articles = Article.all		
	end

	def new
		@article = Article.new
	end

	def edit
		render 'new'
	end

	def show
	end

	def update
		if @article.update(article_params)
			flash[:notice] =  "The Article was successfully updated"
			redirect_to article_path(@article)
		else
			render 'new'
		end
	end

	def create
		@article = Article.new(article_params)	
		if @article.save
			flash[:notice] = "The Article was created."
			redirect_to article_path(@article)
		else
			render 'new'
		end
	end	

	def destroy
		@article.destroy
		flash[:notice] = "Article destroyed"
		redirect_to articles_path
	end

	private

	def article_params
		params.require(:article).permit(:title, :description)
	end

	def find_model
		@article = Article.find(params[:id]) if params[:id]
	end
end