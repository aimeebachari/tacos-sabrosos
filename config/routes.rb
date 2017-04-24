Rails.application.routes.draw do
  devise_for :users

  resources :taco_shops do
    resources :reviews
  end

  resources :reviews

  namespace :api do
    namespace :v1 do
      resources :taco_shops, only: [:show] do
        resources :reviews, only: [:get, :create]
      end
    end
  end
end
