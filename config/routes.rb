Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/account', to: 'users#user_account'
      post '/login', to: 'auth#create'
      resources :users, only: [:create]
      resources :buoys, only: [:index, :show]
      resources :beaches, except: [:destroy]
      # potentially removing in lieu of passing associations through `users#user_account`
      resources :favorite_beaches, only: [:index]
      
      shallow do
        resources :entries do
          resource :beach, only: [:show]
          get '/beach/buoys', to: 'buoys#beach_buoys_index'
        end
      end
    end
  end
end
