Rails.application.routes.draw do
  devise_for :users
  root 'top#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books, only: [:create, :index, :show, :edit, :update, :destroy] do
  	resource :post_comments, only: [:create, :destroy]
  	resource :favorites, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :index, :update] do
  	resource :follows, only: [:index, :show]
  	resource :followers, only: [:index, :show]
  end
  resources :relationships, only: [:create, :destroy]
  get '/home/about' , to: 'top#about'
end