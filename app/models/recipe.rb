class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_ingredients
  has_many :products, through: :recipe_ingredients
  has_one_attached :image

  ratyrate_rateable "rate"
end
