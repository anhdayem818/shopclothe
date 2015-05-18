class ItemGioHangsController < ApplicationController
	
	def show
	end

	def edit
	end

	def index
	    if session["giohang"].nil?
	       session["giohang"] = []
	    end
	    price = Product.find(params[:id]).price
	    session["item"] = {:id => params[:id].to_i,:name => params[:name],:quantity => params[:quantity].to_i, :price => price.to_i, :total => (params[:quantity].to_i * price.to_i) }
	    kiemtra session["item"]
	    redirect_to giohangs_url
	end

	def xoahang
		id = params[:id]		
  		if !session["giohang"].nil?  
  			session["giohang"].each do |x|  				
  				if x['id'].to_i == id.to_i
  					session["giohang"].delete(x)
  					break
  				end
  			end
  		end  		
  		redirect_to giohangs_url
  	end

	private
  	def kiemtra item
    check = false    
    session["giohang"].each do |s| 
	    puts s['id']
	    puts s['quantity']
	    puts s['total']
	      	if s['id'] == item[:id]
	          s['quantity'] = s['quantity'] + item[:quantity].to_i
	          s['total'] = s['total'] + item[:total]
	          return
	      	end
	    end       
	    session["giohang"].push(item)
  	end


end
