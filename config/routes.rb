Rails.application.routes.draw do
  resources :users, only: [:index]
  resources :articles, only: [:index, :destroy, :create]
end
