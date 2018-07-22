class RecipePolicy
  attr_reader :user, :recipe

  def initialize(user, recipe)
    @user = user
    @recipe = recipe
  end

  def edit?
    user.present? && user == recipe.user || user.admin?
  end

  alias_method :update?, :edit?

end
