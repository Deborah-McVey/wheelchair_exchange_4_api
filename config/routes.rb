Rails.application.routes.draw do
  get 'users/index'
  get 'web/bootstrap'
  #get 'sessions/create'
  scope '/' do
    post 'login', to: 'sessions#create'
  end
  resources :comments
  resources :posts #, only: [:create, :update, :destroy]
  resources :users do
    get 'posts', to: 'users#posts_index'
    end
  end
  # localhost:3000/users
  #get '/users', to: 'users#index'

  # localhost:3000/users/1
  #get '/users/:id', to: 'users#show'

  # localhost:3000/users
  #post '/users', to: 'users#create'

  # localhost:3000/users/1
  #put '/users/:id', to: 'users#update'

  # localhost:3000/users/1
  #delete '/users/:id', to: 'users#destroy'

  #resources :users

  # localhost:3000/users/1/posts
  # get '/users/:id/posts', to: 'users#posts_index'
  
  