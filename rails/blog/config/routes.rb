Rails.application.routes.draw do
  resource :session
  resources :passwords, param: :token
  root "posts#index"

  resources :users, only: [ :index, :show, :create, :new ] do
    member do
      post :follow
      delete :unfollow
    end
  end

  resources :posts do
    resources :comments, only: [ :create, :destroy, :edit, :update ]
  end
end
