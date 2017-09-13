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

  #Post routes
  get '/posts', to: 'posts#index', as: 'posts'
  get '/post/new', to: 'posts#new', as: 'new_post'
  get '/posts/:id/edit', to: 'posts#edit', as: 'edit_post'
  patch '/posts/:id', to: 'posts#update'
  get '/posts/:id', to: 'posts#show', as: 'post'
  post '/posts', to: 'posts#create', as: 'create_post'

end
