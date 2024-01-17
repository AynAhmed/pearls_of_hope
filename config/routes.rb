Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
 
  root "home#index" # Assuming you have a HomeController with an index action

  resources :volunteers, only: [:index] # Assuming you have a VolunteersController with an index action
  resources :calendar, only: [:index]   # Assuming you have a CalendarController with an index action
  resources :cart, only: [:index]# Assuming you have a CartController with an index action
  resources :donation, only: [:index]   # Assuming you have a DonationController with an index action

  resources :students
  resources :profile

  resources :programs do 
    resources :courseworks
  end

  resources :products

  resources :carts 
end