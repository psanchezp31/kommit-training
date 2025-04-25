Rails.application.routes.draw do
  resource :session
  resources :passwords, param: :token
  root "posts#index"

  resources :users, only: [ :index, :show, :create ]

  resources :posts
end
