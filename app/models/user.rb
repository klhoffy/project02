class User < ActiveRecord::Base
    has_secure_password
    has_one :cart

    def current_cart
    	if self.cart.empty?
    		self.cart.create
    	end
    	self.cart
    end
end
