class Category < ActiveRecord::Base
	validates :category_name, presence: true, length: { maximum: 30, minimum: 3 }
	validates_uniqueness_of :category_name
end