Rails.application.routes.draw do
  root "posts#index"

  resources :users, only: [ :index, :show, :create ]

  resources :posts
end
