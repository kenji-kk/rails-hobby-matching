Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/hobby_rooms', to: 'hobby_rooms#index'
  post '/hobby_rooms', to: 'hobby_rooms#create'
  get '/hobby_rooms/:id', to: 'hobby_rooms#show', as: 'hobby_room'
  post '/hobby_rooms/join', to: 'hobby_rooms#join'
  resources :users
end
