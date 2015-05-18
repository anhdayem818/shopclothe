class Admin::ProductsController < ApplicationController
  before_filter :kiemtra
  def index
  	@type = Type.all
  end


  def edit
  	@product = Product.find(params[:id])
  end

  def new
  	@product = Product.new
  end

  def create
  	@product = Product.new(product_params)
  	if  @product.save
    return redirect_to controller: 'products', action: 'index'
    else 
    render 'new'
    end 

  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(product_params)
    redirect_to controller: 'products', action: 'index'
    end
  end
  
  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to controller: 'products', action: 'index'
  end
  private

  def product_params
    params.require(:product).permit(:image, :name, :info, :price, :category_id)
  end

  def kiemtra
        authorize! :manage, :all 
  end

end
