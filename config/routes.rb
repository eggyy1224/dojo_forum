Rails.application.routes.draw do
  devise_for :users
  
  root "articles#index"
  resources :articles 
  resources :users do
    member do
      get :draft
      get :collection
      get :follower
      get :comment
    end
  end
end
