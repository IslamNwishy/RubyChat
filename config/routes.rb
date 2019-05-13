Rails.application.routes.draw do
  mount ActionCable.server => '/cable'

  get 'profile', to: 'pages#Profile'
  get "users/profile", to: 'pages#Profile'
  get 'join_room', to: 'pages#rooms'
  get 'users/join_room', to: 'pages#rooms'
  get 'create_room', to: 'pages#create_room'
  get 'users/create_room', to: 'pages#create_room'
  post 'messages', to: 'messages#create'
  post 'create_room',to:'pages#new_room'
  post "users/create_room", to: 'pages#new_room'
  get 'chat_room',to:'pages#chat_room'
  
  devise_for :users, skip:[:registerations]
  devise_scope :user do
    get "edit", to: "devise/regisrations#edit"
  end
  

  root 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
