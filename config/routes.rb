Rails.application.routes.draw do
  root 'home#index'

  #Home route
  get 'home/index', as: 'home'

  #User routes
  get '/users/new', to: 'users#new', as: 'new_user'
  get '/users/:id', to: 'users#show', as: 'user'
  post '/users', to: 'users#create'

  #Session routes
  get '/login', to: 'sessions#new'
   get '/logout', to: 'sessions#destroy'
  post '/sessions', to: 'sessions#create'

end
