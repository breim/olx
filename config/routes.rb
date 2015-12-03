Rails.application.routes.draw do
  devise_for :users
  root 'products#index'
  resources :products, path: :anuncios
  resources :comments, only: [:create, :destroy]
end
