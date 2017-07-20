Rails.application.routes.draw do
  root 'movies#index'

  resources :users, only: [:new, :create, :show] do
    resources :favorites, only: [:index, :show]
    resources :watches, only: [:index, :show]
  end

  get '/login', to: 'sessions#new', as: 'new_login'
  post '/login', to: 'sessions#create', as: 'login'
  delete '/logout', to: 'sessions#destroy', as: 'logout'

  resources :movies, shallow: true do
    resources :comments
  end

  resources :searches, only: [:index]

  resources :favorites, only: [:create]

end
