Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :libraries
  resources :books

  root 'libraries#index'

  # Normal route
  # get 'books' => 'books#index'
end
