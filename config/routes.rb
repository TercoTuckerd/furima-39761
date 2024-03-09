Rails.application.routes.draw do
  get 'items/index'
  devise_for :users
  root to: 'items#index'
  resources :users
  resources :items do
    resources :orders
    resources :comments, only: :create
  end
  #resources :buyers
end