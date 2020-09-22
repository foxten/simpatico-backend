Rails.application.routes.draw do
  resources :friend_requests
  resources :friendships
  resources :markers
  resources :user_group_goals
  resources :goals
  resources :users
  post '/login', to: 'auth#create'
  get '/profile', to: 'users#profile'
end
