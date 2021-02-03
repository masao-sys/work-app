Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'informations#index'

  resources :informations, only: [:show]

  resource :basic_profile, only: [:show, :edit, :update]
  resource :custom_profile, only: [:edit, :update]
  resources :accounts, only: [:show, :edit, :update]
end
