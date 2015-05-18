class Admin::BillsController < ApplicationController
  before_filter :kiemtra
  def index
  	@bills = Bill.where("status =? ", 0)
  end

  def update
  	bill = Bill.find(params[:id])
  	bill.status = 1
  	bill.save
  		return redirect_to :back
  end	

  def kiemtra
        authorize! :manage, :all 
  end
end
