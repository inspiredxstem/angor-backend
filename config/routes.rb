Rails.application.routes.draw do
  post "/login", to: "users#login"
  get "/me", to: "users#me"
  post "/users", to: "users#create"
  get "/users", to: "users#index"
  get "/pending_requests", to: "users#all_pending_requests"
  delete "/users/:id", to: "users#destroy"
  patch "/users/:id", to: "users#update"
  
  # handles friend requests (sent and received)
  resources :friendships

  # resources :users
  resources :messages, only: [:create, :update]
  resources :conversations, only: [:index, :show, :create]

  mount ActionCable.server => '/cable'
  
end