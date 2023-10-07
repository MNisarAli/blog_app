Rails.application.routes.draw do
  # Define the devise routes
  devise_for :users
  
  # Define the application routes
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create] do
      resources :comments, only: [:new, :create]
      resources :likes, only: [:create]
    end
  end

  # Define the API routes
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users do
        resources :posts do
          resources :comments
        end
      end
    end
  end

  # Defines the root path route ("/")
  root "users#index"
end
