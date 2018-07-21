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
      redirect_to edit_recipe_path(recipe), notice: 'Przepis dodany'
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
      redirect_to @recipe, notice: 'Dodano produkty'
    else
      render :edit
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
  end

  def add_products
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :difficulty)
  end
end
