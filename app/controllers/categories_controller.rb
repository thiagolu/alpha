class CategoriesController < ApplicationController

	before_action :admin?, only: [ :create, :new, :edit ]

	def index
		@categories = Category.paginate(page: params[:page], per_page: 1)
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

	def show
		@category = Category.find(params[:id])
	end

	private

	def category_params
		params.require(:category).permit(:category_name)
	end

end