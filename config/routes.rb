Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users
  ActiveAdmin.routes(self)
  
  resources :home
  resources :reviews do
    resources :reviewcomments, only: [:create, :destroy]
  end
  
  resources :onlines do
    resources :comments, only: [:create, :destroy]
  end
  
  resources :shares do
    resources :sharecomments, only: [:create, :destroy]
  end
  
  resources :frees do
    resources :freecomments, only: [:create, :destroy]
  end
  
  resources :companies do
    resources :comcomments, only: [:create, :destroy]
  end
  
  root "home#index"
end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
