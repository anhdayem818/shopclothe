class Detail < ActiveRecord::Base
	attr_accessible :bill_id, :product_id, :price, :quantity, :total
	belongs_to :bill
	belongs_to :product
end
