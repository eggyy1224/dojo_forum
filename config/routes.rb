Rails.application.routes.draw do
  devise_for :users
  
  namespace :admin do
    root "users#index"

    resources :users, only: [:index, :update]
    resources :categories, only: [:index, :create, :edit, :update, :destroy]
  end

  root "articles#index"
  resources :articles do
    member do
      post :comment
      post :collect
      post :uncollect
    end
  end
  resources :users do
    member do
      get :draft
      get :collection
      get :follower
      get :comment
    end
  end

  resources :comments, only: [:edit, :update, :destroy]
  resources :feeds, only: [:index]
  resources :invitations, only: [:create, :destroy] do
    member do
      post :accept
      post :decline
    end
  end

  resources :friendships, only: [:destroy]
end
