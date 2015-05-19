class BillsController < ApplicationController
	def index
		@bills = Bill.where("user_id =? AND status =?", current_user.id, 0 )				
	end 	
end
