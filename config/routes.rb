Rails.application.routes.draw do
  root 'movies#index'

  resources :users, only: [:new, :create, :show] do
    resources :favorites, only: :index
    resources :watches, only: :index
  end

  get '/login', to: 'sessions#new', as: 'new_login'
  post '/login', to: 'sessions#create', as: 'login'
  delete '/logout', to: 'sessions#destroy', as: 'logout'

  resources :movies, shallow: true do
    # resources :comments
    resources :favorites, only: :create
    resources :watches, only: :create
  end

  resources :comments

  post '/movies/search', to: 'movies#search', as: 'search_movies'

end
