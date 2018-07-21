class Recipe < ApplicationRecord
  has_many :recipe_ingredients
  has_many :products, through: :recipe_ingredients
end
