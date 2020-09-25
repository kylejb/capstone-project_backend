Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      get '/user', to: 'users#show'
      post '/login', to: 'auth#create'

      # resources :buoys, only: [:index]
      resources :entries, only: [:index]
      resources :beaches, only: [:index]
      resources :favorite_beaches, only: [:index]
    end
  end
end
