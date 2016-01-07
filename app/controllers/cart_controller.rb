class CartController < ApplicationController
	before_action :authenticate

	def add
		@user = User.find(params[:id])
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

	def index
		@user = User.find(params[:user_id])
		if session[:cart] then
			@cart = session[:cart]
		else
			@cart = {}
		end
		if @user != current_user
      		redirect_to login_path
    	end
	end

	private
		def cart_params
			params.require(:cart).permit(:price_total, :user_id)
		end

end
