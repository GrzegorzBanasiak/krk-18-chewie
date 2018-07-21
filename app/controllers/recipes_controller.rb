class RecipesController < ApplicationController
  before_action :set_recipe



  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :difficulty)
  end
end
