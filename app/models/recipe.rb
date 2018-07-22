# frozen_string_literal: true

class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_ingredients
  has_many :products, through: :recipe_ingredients
  has_one_attached :image

  ratyrate_rateable "rate"

  def calories
    nutrition(:calories)
  end

  def carbohydrates
    nutrition(:carbohydrates)
  end

  def protein
    nutrition(:protein)
  end

  def fat
    nutrition(:fat)
  end

  private

  def nutrition(name)
    amount = 0
    recipe_ingredients.each do |ingredient|
      rate = ingredient[:weight]/100
      amount += ingredient.product[name] * rate
    end
    amount
  end
end
