# frozen_string_literal: true
class RecipesController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :find_recipe, only: [:show, :edit, :update, :destroy]
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def index
    @recipes = current_user.recipes.all
  end

  def new
    @recipe = current_user.recipes.build
  end

  def create
    recipe = current_user.recipes.build(recipe_params)
    recipe.image.attach(params[:recipe][:image])
    if recipe.save
      redirect_to edit_recipe_path(recipe), notice: 'Recipe saved'
    else
      render 'new'
    end
  end

  def show;end

  def edit
    authorize @recipe
  end

  def update
    authorize @recipe
    if @recipe.update(recipe_params)
      @recipe.image.attach(params[:recipe][:image])
      redirect_to @recipe, notice: 'Product added'
    else
      render :edit
    end
  end


  def add_products
    recipe = Recipe.find(params[:id])
    recipe_ingredient = RecipeIngredient.new(recipe_ingredient_params.merge(recipe_id: recipe.id))
    if recipe_ingredient.save
      redirect_to edit_recipe_path(recipe)
    else
      redirect_to edit_recipe_path(recipe)
    end
  end

  private

  def find_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :difficulty, :image, :public)
  end

  def recipe_ingredient_params
    params.require(:recipe_ingredient).permit(:product_id, :weight)
  end

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end
end
