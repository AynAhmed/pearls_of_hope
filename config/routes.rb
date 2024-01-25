Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  get "up" => "rails/health#show", as: :rails_health_check
  root "home#index"

  resources :calendar, only: [:index]
  resources :carts, only: [:index]
  resources :donation, only: [:index]

  resources :volunteers, only: [:index]
  resources :calendar, only: [:index]

  resources :profiles

  resources :programs, only: [:index, :show] do
    member do
    end
    resources :courseworks
  end

  resources :about, only: [:index]
end
