Rails.application.routes.draw do
  devise_for :users
  resources :taco_shops
end
