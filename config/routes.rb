Rails.application.routes.draw do
  root 'hotels#index'
  resources :hotels do
    resources :branches, except: [:update, :destroy]
  end

  resources :branches, only: [:update, :destroy]

  get "signup", to: "users#new"
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  get "manage", to: "users#manageusers"

  resources :users, only: [:index, :show, :edit, :update, :destroy]
  
  get 'adminindex', to: 'hotels#adminindex'
  get 'home/about'
  get 'home/index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end