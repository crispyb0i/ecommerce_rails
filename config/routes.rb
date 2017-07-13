Rails.application.routes.draw do
  # get 'carts/show'

  get 'order_items/create'

  get 'users/show'

  devise_for :users
  root :to => 'products#index'

  patch '/accounts/:account_id/products/:id/favorite' => 'products#favorite', as: 'favorite'
  patch '/accounts/:account_id/products/:id/unfavorite' => 'products#unfavorite', as: 'unfavorite'
  patch '/users/:user_id/products/:id/unfavorite' => 'users#unfavorite2', as: 'unfavorite2'

  resources :charges
  resources :users
  resources :order_items
  resource :cart, only: [:show]

  resources :products do
  resources :order_items
  end
end
