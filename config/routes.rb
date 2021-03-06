# frozen_string_literal: true

Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  devise_for :users
  root 'pages#index'
  get 'pages/panel'
  resources :recipes do
    post 'add_products', on: :member
  end

  resources :products, :recipe_ingredients
end
