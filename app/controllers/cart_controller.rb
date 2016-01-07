class CartController < ApplicationController
	before_action :authenticate

	# def new
	# 	@cart = Cart.new
	# end

	def add
		# @user = User.find(params[:user_id])
		# @product = Product.find(params[:product_id])
		# @cart = @user.cart.new(cart_params)
		# 	if @cart.save
		# 		redirect_to cart_path
		# 	else
		# 		render :show
		# 	end
		# end

		id = params[:id]
			if session[:cart] then
				cart = session[:cart]
			else
				session[:cart] = {}
				cart = session[:cart]
			end
			if cart[id] then
				cart[id] = cart[id] + 1
			else
				cart[id] = 1
			end
			redirect_to :action => :index
		end

	def clearCart
		session[:cart] = nil
		redirect_to :action => :index
	end

	# def update
	# 	if @cart.update.atrributes(cart_params)
	# 		redirect_to to cart_path(@cart)
	# 	else
	# 		render :show
	# 	end
	# end

	# def destroy
	# 	@cart.destroy
	# 	redirect_to root_path
	# end

	def index
		# @user = User.find(params[:id])
		# @cart = Cart.all
		if session[:cart] then
			@cart = session[:cart]
		else
			@cart = {}
		end
		# if @user != current_user
  #     		redirect_to login_path
  #   	end
	end

	# private
	# 	def cart_params
	# 		params.require(:cart).permit(:price_total, :user_id, :product_id)
	# 	end

end
