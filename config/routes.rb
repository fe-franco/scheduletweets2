Rails.application.routes.draw do
  get "about", to: "about#index",as: :about


  get "password", to: "passwords#edit"
  patch "password", to: "passwords#update"

  get "password/reset", to: "password_resets#new"
  post "password/reset", to: "password_resets#create"
  get "password/reset/edit", to: "password_resets#edit"
  patch "password/reset/edit", to: "password_resets#update"

  get "sign_up", to: "registrations#new", as: :signup
  post "sign_up", to: "registrations#create"

  get "sign_in", to: "sessions#new", as: :signin
  post "sign_in", to: "sessions#create"

  delete "log_out", to: "sessions#destroy", as: :logout

  get "auth/twitter/callback", to: "omniauth_callbacks#twitter"

  resources :twitter_accounts
  resources :tweets
  

  root to: "main#index"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
