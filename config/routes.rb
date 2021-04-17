Rails.application.routes.draw do
  devise_for :users
  root to:"results#index"
  resources :users, only: [:edit, :update]
  resources :groups, only: [:new, :create]
  resources :travels, only: [:new, :create]
  resources :travel_selects, only: [:new, :create]
  resources :results, only: [:new, :create]

  get 'results/:id', to: 'results#_checked'
end
