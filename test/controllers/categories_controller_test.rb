require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase

	def setup
		@category = Category.create(category_name: "Sports")
		@user = User.create(username: "test", email:"test@email.com", password: "password" ,role: "admin")
	end

	#routes test
	test "sould get categories index" do
		get :index

		assert_response :success
	end

	test "sould get categories new" do
		session[:user_id] = @user.id
		get :new

		assert_response :success
	end

	test "sould get categories show" do
		get :show, { id: @category.id }

		assert_response :success
	end

	test "redirects to root when user not admin try to create" do
		assert_no_difference 'Category.count' do
			post :create, category: { name: 'nova' }
		end
		assert_redirected_to root_path
	end

end