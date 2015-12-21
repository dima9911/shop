class ProductsController < ApplicationController

	def index
		  @user=User.find(sign_id)
		@products=Product.all

		@count=0
		if session[:buy_product]
	session[:buy_product].each do |ses|
		@count=@count+ses[1]
	end
end
		render 'index'
	end

def show
    @product = Product.find(params[:id])
  end

  def addtocart
    product = Product.find(params[:id])
a=0
if session[:buy_product]

    session[:buy_product].each do |ses|

    	if ses[0]==product.id

    		ses[1]=ses[1]+1
    		a=1
    		break
    
    	end

    end
if a==0
(session[:buy_product] ||= []) << product.id

    index = session[:buy_product].index(product.id.to_i)

    session[:buy_product][index] = Array.new(2)

session[:buy_product][index][0] = product.id
session[:buy_product][index][1] = 1
end


else
(session[:buy_product] ||= []) << product.id

    index = session[:buy_product].index(product.id.to_i)

    session[:buy_product][index] = Array.new(2)

session[:buy_product][index][0] = product.id
session[:buy_product][index][1] = 1

 	
end
	

 redirect_to "/products"
  end

  def showcart

i=0
@cart=Array.new
   if session[:buy_product] && session[:buy_product].size>0

	session[:buy_product].each do |ses|
		# (@cart ||= []) << Product.find(ses[0])

		@cart[i] = Array.new(2)
		@cart[i][0] = Product.find(ses[0])
		@cart[i][1] = ses[1]
		i=i+1
		
	end
  	render 'cart'

  else
  

  	flash[:notice] = ""
  	render 'cart'
  
  end



  end


  def dropatcart
  	
  	# index = session[:buy_product].index(params[:id].to_i)

  	# session[:buy_product].delete_at(index)

  	session[:buy_product].each do |ses|

  		if ses[0]==params[:id].to_i

  			if ses[1]>1
  				ses[1]=ses[1]-1
  			else
  				index = session[:buy_product].index(ses)

  				session[:buy_product].delete_at(index)
  			end

  		end

  	end


  	 redirect_to "/showcart"
	# @par=params[:id]  	
  	# render 'sh'

  end

def edit

	@product = Product.find(params[:id].to_i)

	render 'edit'


end

def update
	
	product = Product.find(params[:id].to_i)

	product.name = params[:product][:name]

	product.count = params[:product][:count]

	product.price = params[:product][:price]

	product.save

	redirect_to '/products'

end


	def delete

		Product.delete(params[:id].to_i)

		redirect_to '/products'

	end
  	

  	def new
  		
  		@product=Product.new

  	end

  	def create
  		 product = Product.create(name: params[:product][:name], price: params[:product][:price], count: params[:product][:count] )
  		 product.save
  		 redirect_to '/products'
  	end

end
