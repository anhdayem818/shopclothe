class Bill < ActiveRecord::Base
	attr_accessible :user_id, :total, :status
	has_many :details
	belongs_to :user

end
