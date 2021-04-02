Rails.application.routes.draw do
  devise_for :users
  get 'results/index'
  root to:"results#index"
  resources :users, only: [:edit, :update]
  resources :groups, only: [:new, :create]
  resources :travels, only: [:new, :create]
  resources :travel_selects, only: [:new, :create]
end
