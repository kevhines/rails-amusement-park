Rails.application.routes.draw do
  resources :rides
  resources :users
  resources :attractions
  root "static#home"
  get '/signin', to: "sessions#new"
  post '/signin', to: "sessions#create"
  post '/logout', to: "sessions#destroy"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
