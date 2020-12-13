Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users
  ActiveAdmin.routes(self)

  get '/new_notifications/read_all' => 'new_notifications#read_all'
  resources :new_notifications
  
  resources :home, only: [:show]
  resources :comments, only: [:create, :destroy]
  resources :reviews do
    resources :reviewcomments, only: [:create, :destroy]
  end
  
  resources :onlines do
    resources :oncomments, only: [:create, :destroy]
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
