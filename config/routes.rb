Rails.application.routes.draw do
  get 'session/new' ,to:'session#new'
  root 'chatroom#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
