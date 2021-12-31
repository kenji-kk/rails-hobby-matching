Rails.application.routes.draw do
  get 'sessions/new'
  get 'hobby_rooms/index'
  resources :users
end
