Rails.application.routes.draw do
  root 'movies#index'

  resources :users, only: [:new, :create, :show] do
    resources :favorites, only: [:index, :show, :create]
    resources :watches, only: [:index, :show, :create]
  end

  get '/login', to: 'sessions#new', as: 'new_login'
  post '/login', to: 'sessions#create', as: 'login'
  delete '/logout', to: 'sessions#destroy', as: 'logout'
  
  resources :movies, shallow: true do
    resources :comments
  end

  post '/movies/search', to: 'movies#search', as: 'search_movies'

  resources :searches, only: [:index]
end