class HomeController < ApplicationController
  def index
  end
    def index
  	#@products = Product.order(:created_at)
  	@categories = Category.all
  	end


	private 
	#tim tat ca nut la trong cay
	def timla  	
    ds = []
  	categories = Category.all
    Category.all.each do |ca|
      ds.push(ca)
    end 
  	# luu vao mang
  	categories.each do |c|
  		   # Neu co cha, thi xoa cha di
  			unless c.category_id.nil?
  				cate = Category.where(:id => c.category_id).first
  				ds.delete(cate)  				
  			end
  		end
  	ds				
    end
end
