Rails.application.routes.draw do
  #this is a test
  devise_for :users
  root to: 'pages#home'
  get :card, to: 'users#card'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :transactions, only: [:new, :create, :index]
  resources :coins, only: :show
  get '/dashboard', to: 'users#dashboard'
  get '/help', to: 'pages#help'
  resources :users, only: :show
  get '/information', to: 'users#information'

  post '/dashboard', to: 'users#dashboard'
end
