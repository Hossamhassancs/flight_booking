Rails.application.routes.draw do
  root :to => "flights#index"
  resources :flights
  devise_for :users
  resources :users do 
    resources :bookings
  end
  get 'search', to: "categories#search"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
