Rails.application.routes.draw do
  #this is a test
  devise_for :users
  root to: 'pages#home'

end
