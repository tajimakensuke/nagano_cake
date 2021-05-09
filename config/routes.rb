Rails.application.routes.draw do

  root to:'public/homes#top'
  devise_for :admin, controllers: {
  sessions:      'admin/sessions',
  passwords:     'admin/passwords',
  registrations: 'admin/registrations'
  }
  devise_for :customers


  scope module: :public do
    resources :items, only: [:index, :show]
    resources :homes, only: [:index]do
      collection do
        get :about
        get :top
      end
    end

    resources :customers, only: [:show, :edit, :update]do
      member do
        get :unsubcribe
        patch :withdraw
      end
    end

    resources :cart_items, only: [:index, :update, :destroy, :create]do
      collection do
        delete :destroy_all
      end
    end

    resources :orders, only: [:new, :create, :index, :show]do
      collection do
        post :comfirm
        get :complete
      end
    end

    resources :addresses, only: [:index, :edit, :create, :update, :destroy]

   end

  namespace :admin do
    resources :homes, only: [:index] do
      collection do
        get :top
      end
    end

    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update,]
    resources :orders, only: [:show, :update, :index]
    resources :order_details, only: [:update, :show]
    end

  end

