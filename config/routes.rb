Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/hobby_rooms', to: 'hobby_rooms#index'
  post '/hobby_rooms', to: 'hobby_rooms#create'
  resources :users
end
