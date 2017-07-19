Rails.application.routes.draw do
  root 'movies#index'

  resources :users, only: [:new, :create, :show]

  get '/login', to: 'sessions#new', as: 'new_login'
  post '/login', to: 'sessions#create', as: 'login'
  delete '/logout', to: 'sessions#destroy', as: 'logout'

  resources :movies do
    resources :comments
  end
  
end
