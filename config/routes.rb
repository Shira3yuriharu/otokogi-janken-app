Rails.application.routes.draw do
  get 'spots/index'
  get 'spots/search'
  devise_for :users
  root to:"results#index"
  resources :users, only: [:edit, :update]
  resources :groups, only: [:new, :create]
  resources :travels, only: [:new, :create, :show]
  resources :travel_selects, only: [:new, :create]
  resources :results, only: [:new, :create, :destroy, :edit, :update]
  resources :travels do
    resources :comments, only: :create
  end
  resources :spots, only: [:index]

  get 'results/checked/:id', to: 'results#checked'
  get 'results/group/:id', to: 'results#checked2'

  get 'spots/search'
end
