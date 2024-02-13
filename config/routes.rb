Rails.application.routes.draw do
  get 'successful/index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  get "up" => "rails/health#show", as: :rails_health_check
  root "home#index"

  resources :enrollments
  resources :calendar, only: [:index]
  resources :carts, only: [:index]
  resources :donation, only: [:index]
  resources :profiles

  get 'dashboard',to: 'dashboards#index'

  get 'dashboard/students', to: 'dashboards#students', as: 'dashboard_students'



  post 'payments/create'
  
  get 'checkout',to: 'checkouts#show'
  get 'checkout/success', to: 'checkouts#success'
  
  get 'billing', to: 'billing#show'

  # post 'create-checkout-session', to: 'programs#create_checkout_session'




  resources :cart_products, only: [:create, :new, :index, :destroy]

  resources :products, only: [:index]

  resources :successful, only: [:index]
  

  resources :students

  # resources :carts, only: [:index, :show, :add, :remove, :clear_cart] do
  #   post 'add', on: :collection # Define 'add' as a collection action
  #   post 'remove', on: :collection # Define 'remove' as a collection action
  #   get 'clear_cart', on: :collection # Define 'clear_cart' as a collection action
  # end

  get "cart", to: 'carts#show'
  post "carts/add"
  post "carts/remove"
  get 'clear_cart', to: 'carts#clear_cart'


  get "products/add_to_cart/:id", to: "products#add_to_cart", as: "add_to_cart"
  delete "products/remove_from_cart/:id", to: "products#remove_from_cart", as: "remove_from_cart"



  resources :programs do
    member do
      get 'al-mustaqbal-academy'
      get 'jewels'
      get 'charms'
      get 'explorers'
      get 'pearls'
      get 'frontiers'
      get 'diamonds'
      get 'climb'
      get 'summer_camp'
    end

  end

  resources :items do
    member do
      get 'al-mustaqbal-academy'
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

  

  resources :s, only: [:index]

  resources :about, only: [:index]

  post '/subscribe', to: 'subscribers#create', as: 'subscribe'

end
