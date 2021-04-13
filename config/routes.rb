Rails.application.routes.draw do
  root to:'homes#top'
  devise_for :customers


  resources :homes, only: [:index]do
    collection do
      get :about
    end
  end
  resources :customers, only: [:show, :edit, :update]do
    member do
      get :unsubcribe
      patch :withdraw
    end
  end
  resources :cart_items, only: [:index, :update, :destroy, :create]do
    member do
      delete :destroy_all
    end
  end
  resources :orders, only: [:new, :create, :index, :show]do
    member do
      post :comfirm
      get :complete
    end
  end
  resources :addresses, only: [:index, :edit, :create, :update, :destroy]

  namespace :admin do
    resources :homes, only: [:index]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update,]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
    end
  end