Rails.application.routes.draw do
  devise_for :users
  root 'pages#index'
  resources :recipes do
    post 'add_products', on: :member
  end

  resources :products
end
