class Bill < ActiveRecord::Base
	validates :value, presence: true	
end