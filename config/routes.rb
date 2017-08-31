Rails.application.routes.draw do
  devise_for :users
  get 'home/home'

  resources :benefices
  resources :zones
  resources :addresses
  resources :customers
  root to: 'home#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
