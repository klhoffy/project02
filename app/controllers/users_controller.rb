class UsersController < ApplicationController
  before_action :authenticate

  def index
    @users = User.all
    if @user != current_user
      redirect_to login_path
    end
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])

  end

  def create
  	@user = User.new(user_params)
  		if @user.save
        log_in @user
        flash[:success] = "Welcome to the Sample App!"
  			redirect_to root_path
  		else
  			render :new
  		end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
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

  def cart
    @products = Product.all
  end

  private
  	def user_params
  		params.require(:user).permit(:email, :password, :password_confirmation, :carts_attributes => [:id, :price_total, :product_id])
  	end
end
