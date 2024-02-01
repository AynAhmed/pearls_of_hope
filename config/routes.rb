Rails.application.routes.draw do
  get 'dashboards/index'
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
  resources :profiles

  get 'dashboard',to: 'dashboards#index'


  get 'checkout',to: 'checkouts#show'
  get 'checkout/success', to: 'checkouts#success'
  get 'billing', to: 'billing#show'

  post 'create-checkout-session', to: 'programs#create_checkout_session'




  
  resources :products, only: [:index]

  resources :profiles

  resources :students

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

    resources :courseworks, only: [:index, :new, :create, :show]
  end


  resources :about, only: [:index]
 
end
