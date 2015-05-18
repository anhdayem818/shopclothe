class GiohangsController < ApplicationController
	def index
		
	end

	def show
		q = params[:giohang]
		puts q
	end	

	def thanhtoan
		if current_user.nil? 
			return redirect_to new_user_session_path
		else	
			gh = session['giohang']
			session['giohang'] = nil			
			b = Bill.new
			b.user_id = current_user.id
			tt = 0
			b.save
			puts current_user
			gh.each do |x|
				p = Product.find(x['id'])
				d = p.details.build
				d.product_id = p.id
				d.bill_id = b.id
				d.price = p.price
				d.quantity = x['quantity']
				d.total = p.price * d.quantity
				d.save
				tt = tt + d.total	
			end	

			b.total = tt
			b.save
			return redirect_to root_path
		end
	end	

end
