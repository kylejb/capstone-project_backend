Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/account', to: 'users#user_account'
      post '/login', to: 'auth#create'
      resources :users, only: [:create]
      resources :buoys, only: [:index, :show] do
        get '/meteorological_data' => 'buoy_meteorological_data#index'
      end
      resources :beaches, only: [:index, :show]
      resources :favorite_beaches, only: [:index, :create]

      shallow do
        resources :entries do
          # beach (belongs_to :entries)
          get '/beach' => 'entry_beach#show'
          #TODO: this create action must be accompanied by buoy associations using lat-long
          post '/beach' => 'entry_beach#create'
          # patch '/beach' => 'entry_beach#update'
          # put '/beach' => 'entry_beach#update'
          
          # buoys (has_many :beaches)
          # get '/beach/buoys' => 'beach_buoys#show'
        end
      end
    end
  end
end
