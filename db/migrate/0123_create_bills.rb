class CreateBills < ActiveRecord::Migration
	def change
		create_table :bills do |t|
			t.string :bill_name
			t.text :description
			t.decimal :value

			t.timestamps null: false
		end		
	end
end