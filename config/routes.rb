Rails.application.routes.draw do
  resources :benefices
  resources :zones
  resources :addresses
  resources :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
