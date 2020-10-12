Rails.application.routes.draw do
      resources :players
      resources :contracts
      resources :teams
      resources :leagues
      resources :users
      # get '/stats', to: 'players#stats'
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html