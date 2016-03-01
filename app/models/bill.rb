class Bill < ActiveRecord::Base

	belongs_to :user

	validates :value, presence: true	

	def self.get_bills(bills)
		bills_hash = {}
		bills_hash['paid'] = bills.where(paid: true)
		bills_hash['not_paid'] = bills.where(paid: false)
		bills_hash
	end
end