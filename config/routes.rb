Rails.application.routes.draw do
  get 'users/index'
  resources :users, only: [:index] do
    resources :articles, only: [:index, :create, :destroy]
  end
  resources :articles, only: [:index, :create]
end
