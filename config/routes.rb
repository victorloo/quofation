Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :designers, only: [:index, :show] do
    resources :products, only: [:index, :show]
  end
  root "designers#index"

  resources :thirtydays, only: [:index, :show] do
    collection do
      get :designers, to: "thirtydays#designers"
      get :products, to: "thirtydays#products"
    end
    resources :fittingphotoes, path: 'album', only: [:index, :show]
  end

  #建立後台設計師CRUD
  namespace :admin do
    resources :designers
  end

  namespace :admin do
    resources :products
    root "products#index"
  end

end
