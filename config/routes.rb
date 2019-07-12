Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'

  resources :blogs
  resources :posts
  
end
