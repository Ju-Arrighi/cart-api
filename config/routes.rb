Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :products, only: [:index]
  resources :cart do
    resources :orders
    resources :invoice, only: [:show]
  end
end
