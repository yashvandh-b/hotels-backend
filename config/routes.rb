Rails.application.routes.draw do
  
  root to: 'hotels#index'
  devise_for :users
  resources :hotels

  get 'adminindex', to: 'hotels#adminindex'
  #root 'home#index'

  #get 'home/index'
  get 'home/about'
  get 'home/index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end