    class Category < ActiveRecord::Base
    	has_many :products

      

      def self.import_from_csv
      
      # => Load CSV file from folder:  
      # csvfile = File.read('app\assets\csv_file\products1.csv')
      # csv = CSV.parse(csvfile, :headers => true)

      # => Load CSV file from URL:
         uri = URI('https://dl.dropboxusercontent.com/u/6582068/products.csv')
         @csv_data = Net::HTTP.get(uri)
          csv = CSV.parse(@csv_data, :headers => true)
            csv.each do |row|
              # =>  Find if 'name' (Unique) exists in Category, else create new
              c = Category.find_by_name(row[1])|| Category.new(:name => row[1])
              c.save
              # =>  Find existing Category to retrieve Category id
              @get_Category_id = Category.find_by_name(row[1])
              # =>  Find if 'product_id' (Unique) exists in Product, else create new
              p = Product.find_by_product_id(row[0])
              if p != nil
                p.update(:product_id => row[0], :product_name => row[2], :price => row[3], :category_id => @get_Category_id.id)
              else
                p = Product.new(:product_id => row[0], :product_name => row[2], :price => row[3], :category_id => @get_Category_id.id )
              end
              p.save
           
          end     
      end
    end
