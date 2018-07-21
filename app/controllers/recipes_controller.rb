class RecipesController < ApplicationController

  def index
  end

  def show
  end

  private

  def set_recipe
    @recipe = REcipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :difficulty)
  end
end
