Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :designers, only: [:index, :show] do
    resources :products, only: [:index, :show] do
      resources :comments, only: [:create, :destroy]
    end
  end
  resources :products, only: [:index, :show] do
    post :add_to_cart, on: :member
    post :remove_from_cart, on: :member
    post :adjust_item, on: :member
    collection do
      get :category, to: "products#category"
    end
  end
  
  resource :cart
  resources :cart_items, only: [:create, :update, :destroy]

  resources :users, except: [:index, :new, :create, :destroy] do
    resources :chat_rooms, only: [:index, :show]
    get :designer_chat_rooms, on: :member, to: "chat_rooms#designer"
  end

  root "designers#index"

  resources :thirtydays, only: [:index, :show] do
    collection do
      get :category, to: "thirtydays#category"
    end
    resources :comments, only: [:create, :destroy]
  end

  # redis
  mount ActionCable.server => '/cable'

  #建立後台設計師CRUD
  namespace :admin do
    resources :designers do
      resources :products
      resources :categories
    end
    root "designers#index"
    resources :orders
    resources :chat_rooms, except: [:create, :new, :show]
  end
  
  resources :orders do
    post :checkout_spgateway, on: :member
  end

  post 'spgateway/return'
  post "spgateway/notify"
    

end

