Rails.application.routes.draw do
  root 'hotels#index'
  resources :hotels do
    resources :branches, except: [:update, :destroy, :show]
  end

  resources :branches, only: [:update, :destroy, :show]

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  get "manage", to: "users#manageusers"

  resources :users
  
  get 'adminindex', to: 'hotels#adminindex'
  get 'home/about'
  get 'home/index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end