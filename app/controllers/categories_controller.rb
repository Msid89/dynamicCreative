  class CategoriesController < ApplicationController

   
  	def index
      # => Product categories listed in alphabetical order 
      @categories = Category.all.order(:name)	
   	end

    def show    
      # => List of products belonging to a category and display 5 per page
       @category_products =  Product.where(category_id: params[:id]).order(:product_name).page(params[:page]).per(5)
       @category_name = Category.find(params[:id]).name
    end

    def import
      # => Download CSV file from Url and Insert content into database
        Category.import_from_csv      
        redirect_to  root_url, notice: "Import Complete."
    end

  end
