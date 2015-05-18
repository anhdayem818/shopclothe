class ProductsController < ApplicationController
	def index
  	@produts = Product.all
  end

  
  def show
  	@product = Product.find(params[:id])
    @category = Category.find(@product.category_id)

  end

end
