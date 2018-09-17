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

  resources :users, except: [:index, :new, :create, :destroy]

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
  resources :chat_rooms, only: [:index, :show, :new, :create]
  # redis
  mount ActionCable.server => '/cable'

  #建立後台設計師CRUD
  namespace :admin do
    resources :designers do
      resources :products
    end
    root "designers#index"
  end


    

end
