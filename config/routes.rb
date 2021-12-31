Rails.application.routes.draw do
  get 'hobby_rooms/index'
  resources :users
end
