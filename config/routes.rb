Rails.application.routes.draw do
  get 'carts/index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  get "up" => "rails/health#show", as: :rails_health_check
  root "home#index"


  resources :calendar, only: [:index]
  resources :carts, only: [:index]
  resources :donation, only: [:index]
  resources :volunteers, only: [:index]
 
# config/routes.rb
resources :checkout, only: [:index, :show] do
  post :update_cart, on: :collection
  get :show_cart, on: :collection
end

  post 'create-checkout-session', to: 'programs#create_checkout_session'
  get 'checkout/success', to: 'program#success'
  resources :products

  resources :profiles

  get "products/add_to_cart/:id", to: "products#add_to_cart", as: "add_to_cart"
  delete "products/remove_from_cart/:id", to: "products#remove_from_cart", as: "remove_from_cart"

  resources :programs do
    member do
      get 'house_of_scholars'
      get 'jewels'
      get 'charms'
      get 'explorers'
      get 'pearls'
      get 'frontiers'
      get 'diamonds'
      get 'climb'
      get 'summer_camp'
    end

    resources :courseworks
  end


  resources :about, only: [:index]
 
end
