class Category < ActiveRecord::Base

	has_many :article_categories
	has_many :articles, through: :article_categories

	validates :category_name, presence: true, length: { maximum: 30, minimum: 3 }
	validates_uniqueness_of :category_name
end