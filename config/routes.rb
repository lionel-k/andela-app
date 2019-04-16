Rails.application.routes.draw do
  get 'users/index'
  resources :users, only: [:index]
  resources :articles, only: [:index, :destroy, :create]
end
