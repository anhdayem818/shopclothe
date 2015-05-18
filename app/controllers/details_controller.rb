class DetailsController < ApplicationController


	def new
		@detail = Detail.new
	end	

	def create
		@detail = Detail.new(:detail)
		respond_to do |format|
		  format.json {head :no_content}
		end
	end
end
