# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :user

  validates :name,
    presence: true,
    length: {minimum: 3, maximum: 200}
  validates :calories, :carbohydrates, :protein, :fat,
    presence: true,
    numericality: true

  def to_s
    name
  end

end
