Rails.application.routes.draw do
  root "sessions#welcome"
  #root "subjects#index" 

  #get "/subjects/:id", to: "subjects#show"
  resources :subjects 

  # resources :users, only: [:new, :create, :edit, :update, :show, :destroy] 
  # get '/login', to: 'sessions#login'
  # post '/login', to: 'sessions#create'
  # post '/logout', to: 'sessions#destroy'
  # get '/logout', to: 'sessions#destroy'

  resources :users, only: [:new, :create]
   get 'login', to: 'sessions#new'
   post 'login', to: 'sessions#create'
   get 'welcome', to: 'sessions#welcome'
   get 'authorized', to: 'sessions#page_requires_login'
   post '/logout', to: 'sessions#welcome'
   get '/logout', to: 'sessions#welcome'
   get 'index', to: 'subjects#index'
   get 'about', to: 'sessions#about'
end
