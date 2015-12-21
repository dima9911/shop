class OrdersController < ApplicationController

	def index

		user = User.find(current_user)

		session[:buy_product].each do |ses|

			product = Product.find(ses[0])
			
			if ses[1]>product.count
				flash[:orderedd] = "OOPS! Your count of some product bigger that max count! Please, correct this"
				break
			end

			order = Order.create()

			order.user_id = user.id

			order.product_id = product.id

			order.count = ses[1]

			order.price = product.price*ses[1]

			order.save

			product.count -= order.count

			product.save


		end

		  flash[:ordered] = "GOOD! You order has been created. We contact with you!"

		  session[:buy_product] = nil

		render "index"


	end


	def allorders

		if current_user.admin
			@orders = Order.all
		else
		@orders=Order.where("user_id = ?", current_user.id)
		end
	end

	def showorder
		
		@order=Order.find(params[:id].to_i)

	end

	def update

		order = Order.find(params[:id].to_i)

		if order.state
			stop_ready order 
		else
			give_ready order
		end

		redirect_to :back

	end

end
