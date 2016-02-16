require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase

	def setup
		@category = Category.create(category_name: "Sports")
	end

	#routes test
	test "sould get categories index" do
		get :index

		assert_response :success
	end

	test "sould get categories new" do
		get :new

		assert_response :success
	end

	test "sould get categories show" do
		get :show, { id: @category.id }

		assert_response :success
	end

end