Rails.application.routes.draw do
  root 'sessions#new'
  post '/group_chats/reply/:id', to: 'group_chats#create_reply'
  post '/group_chats', to: 'group_chats#create_chat'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/hobby_rooms', to: 'hobby_rooms#index'
  post '/hobby_rooms', to: 'hobby_rooms#create'
  get '/hobby_rooms/:id', to: 'hobby_rooms#show', as: 'hobby_room'
  post '/hobby_rooms/join', to: 'hobby_rooms#join'
  post '/hobby_rooms/withdrawal', to: 'hobby_rooms#withdrawal'
  get '/hobby_rooms/chat/:id', to: 'hobby_rooms#chat_group'
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
end
