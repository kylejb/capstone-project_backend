Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/user', to: 'users#show'
      post '/login', to: 'auth#create'
      resources :users, only: [:create]
      resources :favorite_beaches
      resources :beaches, only: [:index, :show]
      resources :buoys, only: [:index, :show]
    end
  end
end
