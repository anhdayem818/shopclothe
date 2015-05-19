class Admin::TypesController < ApplicationController
  def index
  	@type = Type.all
  end


  def edit
  	@type = Type.find(params[:id])
  end

  def new
  	@type = Type.new
  end

  def create
  	@type = Type.new(type_params)
  	if  @type.save
    return redirect_to controller: 'types', action: 'index'
    else 
    render 'new'
    end 

  end

  def update
    @type = Type.find(params[:id])
    if @type.update_attributes(type_params)
    redirect_to controller: 'types', action: 'index'
    end
  end
  
  def destroy
    @type = Type.find(params[:id])
    Category.delete_all(["type_id = ?",params[:id]])
    @type.destroy
    redirect_to controller: 'types', action: 'index'
  end
  private

  def type_params
    params.require(:type).permit(:name)
  end

end
