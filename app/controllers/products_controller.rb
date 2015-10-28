	class ProductsController < ApplicationController
		def index		
		end

		def show
			# => Retrieve product by id
			@product = Product.find(params[:id])
		end

		def destroy
			# => Find product by id and Delete 
			@p = Product.find_by_id(params[:id])
    		@p.destroy
    		redirect_to root_url, notice: 'Product was successfully destroyed.'
    	end
	end

