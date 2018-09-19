Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :designers, only: [:index, :show] do
    resources :products, only: [:index, :show]
  end
  resources :products, only: [:index, :show] do
    post :add_to_cart, on: :member
    post :remove_from_cart, on: :member
    post :adjust_item, on: :member
  end
  
  resource :cart

  resource :orders

  resources :users, except: [:index, :new, :create, :destroy] do
    resources :chat_rooms, only: [:index, :show]
    get :designer_chat_rooms, on: :member, to: "chat_rooms#designer"
  end

  root "designers#index"

  resources :thirtydays, only: [:index, :show] do
    collection do
      get :designers, to: "thirtydays#designers"
      get :products, to: "thirtydays#products"
    end
    resources :comments, only: [:create, :destroy]
    resources :fittingphotos, path: 'album', only: [:index, :show] do
      resources :discussions, only: [:create, :destroy]
    end
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
    resources :chat_rooms, except: [:create, :new, :show]
  end

end