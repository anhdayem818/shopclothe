class ProductsController < ApplicationController
  def index
  	@search = Product.search(params[:q])
  	@products = @search.result.page(params[:page]).per(10)
  	@search.build_condition if @search.conditions.empty?	
  	@search.build_sort if @search.sorts.empty?
  end

  
  def show
  	@product = Product.find(params[:id])
    @category = Category.find(@product.category_id)
  end

end
