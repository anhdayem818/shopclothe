class Category < ActiveRecord::Base
	attr_accessible :name, :type_id
	has_many :products
	belongs_to :type
	  validates :type_id, presence: true
end
