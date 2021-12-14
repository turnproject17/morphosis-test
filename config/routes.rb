Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  ActiveAdmin.routes(self)
    authenticate :user, ->(u) { u.admin? } do
  end
  resources :products, only: [:index, :show]
  namespace :api do
    namespace :v1 do
      devise_for :users
      resource :password
      resources :products
      resources :orders do 
        get :next
      end
      resource :cart
      resource :payment, only: [:create, :show]
    end
  end
end
