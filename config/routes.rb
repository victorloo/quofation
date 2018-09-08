Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resource :products, only: [:index, :show]
  root "products#index"

  namespace :admin do
    root "products#index"
  end



end
