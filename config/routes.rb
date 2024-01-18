Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  get "up" => "rails/health#show", as: :rails_health_check
  root "home#index"


  resources :volunteers, only: [:index]
  resources :calendar, only: [:index]
  resources :cart, only: [:index]
  resources :donation, only: [:index]

  resources :profile

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
  end

  resources :courseworks
  resources :carts
end

