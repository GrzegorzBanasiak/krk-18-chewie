class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_product, only: [:edit, :show, :update, :delete]

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def index
  	@products = Product.all
  end

  def new
  	@product = current_user.products.build
  end

  def edit
    authorize @product
  end

  def create
  	product = current_user.products.build(product_params)
  	if product.save
  		redirect_to product
  	else
  		render :new
  	end
  end

  def show
  end

  def update
    authorize @product
  	if @product.update(product_params)
  		redirect_to @product
  	else
  		render :edit
  	end
  end

  def delete
  	@product.destroy
  end


  private

  def find_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :calories, :carbohydrates, :protein, :fat)
  end

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end
end
