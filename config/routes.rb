Rails.application.routes.draw do
  get 'categories/show'

  devise_for :users
  
  namespace :admin do
    root "users#index"

    resources :users, only: [:index, :update]
    resources :categories, only: [:index, :create, :edit, :update, :destroy]
  end

  root "articles#index"
  resources :categories, only: [:show]
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

  namespace :api, defaults: {format: :json} do
    namespace :v1 do

      post "/login" => "auth#login"
      post "/logout" => "auth#logout"
      
      resources :articles, only: [:index, :create, :show, :update, :destroy]
    end
  end
end
