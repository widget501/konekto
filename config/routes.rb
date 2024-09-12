Rails.application.routes.draw do
  devise_for :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  # root to: "home#index"
  root to: "pages#home"

  resources :categories, only: [:index, :show, :new, :create] do
    resources :topics, only: [:new, :create] do
      resources :posts, only: [:index, :new, :create, :show, :update, :edit, :destroy] do
        resources :comments, only: [:new, :create]
        resources :likes, only: [:create, :destroy]
      end
    end
  end
  resources :users
  resources :topics, only: [:index, :show, :edit, :update]
  resources :posts, only: [:edit, :update, :delete]
  resources :likes, only: [:delete]
end
