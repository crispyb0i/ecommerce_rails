Rails.application.routes.draw do
  get 'carts/show'

  get 'order_items/create'

  get 'users/show'

  devise_for :users
  root :to => 'products#index'

  resources :users
  resources :order_items
  resource :cart, only: [:show]

  resources :products do
  resources :order_items
  end
end
