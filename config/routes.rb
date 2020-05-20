Rails.application.routes.draw do
  resources :users, only: [:create, :show]
  get '/signup', to: 'users#new'

  resources :sessions, only: [:create, :destroy]
  get '/login', to: 'sessions#new'
end
