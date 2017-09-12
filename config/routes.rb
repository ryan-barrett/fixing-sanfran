Rails.application.routes.draw do
  root 'home#index'

  #Home route
  get 'home/index', as: 'home'
end
