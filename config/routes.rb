Rails.application.routes.draw do

  root 'sessions#new'

  get '/login',     to: 'sessions#new'
  post '/login',    to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  resources :posts, only: [:new, :create, :show, :index]

end