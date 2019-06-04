Rails.application.routes.draw do
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/signout', to: 'sessions#delete'
  root 'application#index'

  resources :posts, only: [:new, :create, :index]
end
