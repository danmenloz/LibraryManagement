Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/show'
  get 'sessions/create'
  get 'sessions/destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :hold_requests
  resources :users
  resources :libraries
  resources :books
  resources :sessions

  root 'sessions#new'

  # Normal route
  # get 'books' => 'books#index'
  get 'home', to: 'sessions#show', as: 'home'
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
end
