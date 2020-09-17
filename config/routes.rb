Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      # below two resources are temp for testing purposes
      resources :users
      resources :buoys
    end
  end
end
