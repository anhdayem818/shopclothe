class CategoriesController < ApplicationController
  def index
  	@categories = Category.all 	
  end

  def new
  end

  def edit
  end

  def delete
  end
    
  def show
    #offset = 9
    #trang = params[:trang].nil? ? 1 : params[:trang].to_i 
    @products = Category.find(params[:id]).products.page(params[:page]).per(6)
    #@sotrang = t % offset == 0 ? t/offset : t/offset+1
  	#@products = Product.where("category_id = ?", params[:id] ).offset(trang * offset - offset).take(offset)
  end

  def update
  end

  def destroy
  end

end
