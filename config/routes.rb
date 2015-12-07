Rails.application.routes.draw do
  devise_for :users
  root 'products#index'
  resources :products, path: :anuncios do
  	get 'myproducts', on: :collection, path: 'meus-produtos'
  end
  resources :comments, only: [:create, :destroy, :index], path: :mensagens

  # Admin routes
  get '/admin' => "admin/admin#index", as: :admin 
  namespace :admin do
  	resources :products
  end
end
