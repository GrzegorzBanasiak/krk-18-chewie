# frozen_string_literal: true

class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_ingredients
  has_many :products, through: :recipe_ingredients

  ratyrate_rateable "rate"
end
