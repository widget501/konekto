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
    resources :topics, only: [:new, :create]
  end

  resources :topics, only: [:index, :show] do
    resources :posts, only: [ :new, :create]
  end

  resources :posts, only: [ :show, :edit, :update, :destroy] do
    member do
      post 'like', to: 'posts#like'
      delete 'unlike', to: 'posts#unlike'
    end
    resources :comments, only: [:new, :create]
  end
  get 'new_ai_topic', to: 'topics#new_ai_topic', as: 'new_ai_topic'
  get 'search', to: 'search#index'
end
