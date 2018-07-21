class ProductsController < ApplicationController
  def index
  	@products = Product.all
  end

  def new
  	@product = Product.new
  end

  def create
  	product = Product.new(product_params)
  	if product.save
  		redirect_to product
  	else
  		render :new
  	end
  end

  def show
  	@product = Product.find(params[:id])
  end

  def update
  end

  def delete
  	@product = Product.find(params[:id])
  	@product.destroy
  end

  private

  def product_params
    params.require(:product).permit(:name, :calories, :carbohydrates, :protein, :fat)
  end
end
