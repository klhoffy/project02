class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def create
  	@user = User.new(user_params)
  		if user.save
  			redirect_to user_path
  		else
  			render :new
  		end
  end

  def update
  	if @user.update_attributes(user_params)
  		redirect_to user_path(@user)
  	else
  		render :edit
  	end
  end

  def destroy
    @user.destroy
    redirect_to root_path
  end

  private
  	def user_params
  		params.require(:user).permit(:username, :email, :password, :password_confirmation)
  	end
end
