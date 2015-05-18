class Admin::CategoriesController < ApplicationController
  before_filter :kiemtra

  def index
  	@type = Type.all
  end


  def edit
  	@category = Category.find(params[:id])
  end

  def new
  	@category = Category.new
  end

  def create
  	@category = Category.new(category_params)
  	if  @category.save
    return redirect_to controller: 'categories', action: 'index'
    else 
    render 'new'
    end 

  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(category_params)
    redirect_to controller: 'categories', action: 'index'
    end
  end
  
  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to controller: 'categories', action: 'index'
  end
  private

  def category_params
    params.require(:category).permit(:name, :type_id)
  end

  def kiemtra
        authorize! :manage, :all 
  end
end
