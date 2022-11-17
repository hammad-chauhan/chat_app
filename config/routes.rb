Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'chatroom#index'
  get '/login', to: 'sessions#new'
  post '/login', controller: "sessions", action: "create"
  delete '/logout', controller: "sessions", action: "destroy"
  post 'message', to: 'messages#create'
end
