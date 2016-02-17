require 'test_helper'

class ListCategoriesTest < ActionDispatch::IntegrationTest

	def setup
		@category = Category.create category_name: "sport" 		
	end

	test "list categories" do
		get categories_path
		assert_template 'categories/index'
		assert_select "a[href=?]", category_path(@category), text: @category.category_name
	end
end