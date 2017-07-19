Rails.application.routes.draw do
  root 'movies#index'

  resources :users, only: [:new, :create, :show]

  get '/login', to: 'sessions#new', as: 'new_login'
  post '/login', to: 'sessions#create', as: 'login'
  delete '/logout', to: 'sessions#destroy', as: 'logout'

  resources :movies, shallow: true do
    resources :comments
  end

  resources :users do
    resources :favorites, only: [:index]
  end

  resources :users do
    resources :watches, only: [:index]
  end

  resources :searches, only: [:index]

end
