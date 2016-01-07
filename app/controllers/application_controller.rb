class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :log_in, :logged_in, :authenticate, :current_cart
  	def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!current_user
  end

  def authenticate
   unless logged_in?
     flash[:notice] = "You must be logged in to access this section of the site"
     redirect_to login_url
   end
 end

 def current_cart
  @current_cart ||= Cart.find_by(id: session[:user_id])
 end

end
