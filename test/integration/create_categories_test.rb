require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest

	def setup
		@user = User.create(username: "name", email: "test@email.com", password: "password", role: "admin")
	end

	test "get new category form and create category" do
		post '/login', session: { email: @user.email, password: @user.password }
		get new_category_path

		assert_template 'categories/new'
		assert_difference 'Category.count', 1 do
			post_via_redirect categories_path, category: { category_name: "Sports" }
		end

		assert_template 'categories/index'
		assert_match "Sports", response.body
	end

	test "Invalid Category must fail" do
		post '/login', session: { email: @user.email, password: @user.password }
		
		get new_category_path
		assert_template 'categories/new'
		assert_no_difference 'Category.count' do
			post categories_path, category: { category_name: "s" }
		end

		assert_template 'categories/new'
		assert_select 'h2.panel-title'
		assert_select 'div.panel-body'
	end
end