class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by_email(params[:login][:email])
    if user && user.authenticate(params[:login][:password])
      log_in user
      redirect_to root_path
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render :new
    end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to root_url
  end
end
