Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :products, only: [:index]
  resources :order, only: [:index]
  resources :cart, only: [:index]
  resources :invoice, only: [:index]
end
