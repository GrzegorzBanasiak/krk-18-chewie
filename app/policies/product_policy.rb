# frozen_string_literal: true

class ProductPolicy
  attr_reader :user, :product

  def initializer(user, product)
    @user = user
    @product = product
  end

  def edit?
    user.present? && user == product.user || user.admin?
  end

  alias_method :update?, :edit?
end
