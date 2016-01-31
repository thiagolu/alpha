class Article < ActiveRecord::Base

	belongs_to :user

	validates :title, presence: true, length: { minimum: 3, maximum: 100 }
	validates :description, presence: true, length: { minimum: 3, maximum: 3000 }
	validates :user_id, presence: true
end