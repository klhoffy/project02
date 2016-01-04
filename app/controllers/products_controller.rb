class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
  end

  def create
    @product = Product.new(product_params)
      if product.save
        redirect_to product_path
      else
        render :new
      end
  end

  def update
    if @product.update_attributes(product_params)
      redirect_to product_path(@product)
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to root_path
  end

  private
    def product_params
      params.require(:product).permit(:name, :description, :price, :category, :quantity)
    end

end
