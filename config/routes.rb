Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :products, only: [:index]
  resources :carts, only: [:index, :show]
  resources :carts do
    resources :orders, only: [:show]
    resources :invoice, only: [:show]
  end
end
