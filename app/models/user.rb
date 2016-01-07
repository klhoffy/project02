class User < ActiveRecord::Base
	belongs_to :cart
    has_secure_password
end
