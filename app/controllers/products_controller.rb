class ProductsController < ApplicationController
  def index
  	@products = Product.all
  end

  def new
  	@product = Product.new
  end

  def create
  	# @product = 
  end

  def update
  end

  def delete
  	@product.destroy
  end

  private

  def product_params
    params.require(:product).permit(:name, :calories, :carbohydrates, :protein, :fat)
  end
end
