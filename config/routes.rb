Rails.application.routes.draw do
  devise_for :users
  
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
end
