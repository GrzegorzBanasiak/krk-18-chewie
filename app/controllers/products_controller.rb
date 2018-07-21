class ProductsController < ApplicationController
  def index
  	@product = Product.all
  end

  def new
  	@product = Product.new
  end

  def update
  end

  def delete
  	@product.destroy
  end
end
