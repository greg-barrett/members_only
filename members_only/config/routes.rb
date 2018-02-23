Rails.application.routes.draw do
  get 'users/show'

  root              'static_pages#home'
  get '/home', to: 'static_pages#home'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :posts, only: [:new, :create, :index]
end
