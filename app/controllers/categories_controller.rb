class CategoriesController < ApplicationController

	before_action :admin?, only: [ :create, :new, :edit, :update ]
	before_action :find_category, only: [ :edit, :update, :show ]

	def index
		@categories = Category.all
	end

	def new
		@category = Category.new
	end

	def create
		@category = Category.new category_params

		if @category.save
			flash[:success] = "Category was created successfully"
			redirect_to categories_path
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @category.update category_params
			flash[:success] = "Category was created successfully"
			redirect_to categories_path
		else
			render 'new'
		end
	end

	def show
		@category_articles = @category.articles.paginate(page: params[:page], per_page: 4)
	end

	private

	def category_params
		params.require(:category).permit(:category_name)
	end

	def find_category
		@category = Category.find(params[:id])
	end

end