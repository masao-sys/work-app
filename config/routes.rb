Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'informations#index'

  resources :informations do
    resource :bookmark, only: [:show, :create, :destroy]
    resource :read, only: [:show, :create, :destroy]
    resources :alreadys, only: [:index]
  end
  resources :favorites, only: [:index]

  resources :departments, only: [:index]

  resources :managements do
    resources :management_comments, only: [:index, :create]
  end

  resources :sales do
  end

  resource :basic_profile, only: [:show, :edit, :update]
  resource :custom_profile, only: [:edit, :update]
  resources :accounts, only: [:show, :edit, :update]
  resources :user_lists, only: [:index]
end
