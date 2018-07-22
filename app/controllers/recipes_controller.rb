class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    recipe = Recipe.new(recipe_params)
    if recipe.save
      redirect_to edit_recipe_path(recipe), notice: 'Recipe saved'
    else
      render 'new'
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to @recipe, notice: 'Product added'
    else
      render :edit
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
  end

  def add_products
    recipe = Recipe.find(params[:id])
    recipe_ingredient = RecipeIngredient.new(recipe_ingredient_params.merge(recipe_id: recipe.id))
    redirect_to edit_recipe_path(recipe)
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :difficulty)
  end

  def recipe_ingredient_params
    params.require(:recipe_ingredient).permit(:product_id, :weight)
  end
end
