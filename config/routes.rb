Rails.application.routes.draw do
  resources :users, only: [:index] do
    resources :articles, only: [:index, :create, :destroy]
  end
  resources :articles, only: [:index]
end
