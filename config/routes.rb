Rails.application.routes.draw do

  root to: "homes#top"
  get "/home/about" => "homes#about"


  resources :addresses, only: [:index, :edit, :update, :create, :destroy]


  resources :cart_items, only: [:index, :update, :create, :destroy] do
    collection do
      get 'all_destroy'
    end
  end

  resources :items, only: [:index, :show]

  resources :orders, only: [:new, :create, :index, :show] do
   collection do
     get 'confirm'
     get 'complete'
   end
  end

  resources :customers, only: [:show, :edit, :update] do
    collection do
      get 'unsubscribe'
      get 'out'
    end
  end


  # 顧客用
  # URL/customers/sign_in...

  devise_for :customers, skip:[:passwords,], controllers:{
    registrations: "customer/registrations",
    sessions: "customers/sessions"
  }

  # 管理者用
  # URL /admin/sign_in...

  devise_for :admin, skip:[:registrations, :passwords], controllers:{
    sessions: "admin/sessions"
  }


  namespace :admin do
  resources :items,  only: [:index, :new, :create, :show, :edit, :update]
  resources :categories, only: [:index, :create, :edit, :update]
  resources :order_details, only: [:update]
  resources :customers, only: [:index, :show, :edit, :update]
  end





end
