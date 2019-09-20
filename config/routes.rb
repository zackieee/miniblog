Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations",
    confirmations: "users/confirmations"
  }

  resources :blogs
  resources :posts

  # mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  root 'posts#index'
  
end