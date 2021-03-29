Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'informations#index'

  resources :informations do
    resources :alreadys, only: [:index]
  end
  resources :favorites, only: [:index]

  resources :departments, only: [:index]

  resources :managements

  resources :sales

  resources :productions

  resources :developments

  resource :basic_profile, only: [:show, :edit, :update]
  resource :custom_profile, only: [:edit, :update]
  resources :accounts, only: [:show, :edit, :update]
  resources :user_lists, only: [:index]

  namespace :api, defaults: {format: :json} do
    scope '/informations/:information_id' do
      resource :bookmark, only: [:show, :create, :destroy]
      resource :read, only: [:show, :create, :destroy]
    end

    scope '/managements/:management_id' do
      resources :management_comments, only: [:index, :create]
    end

    scope '/sales/:sale_id' do
      resources :sale_comments, only: [:index, :create]
    end

    scope '/productions/:production_id' do
      resources :production_comments, only: [:index, :create]
    end

    scope '/developments/:development_id' do
      resources :development_comments, only: [:index, :create]
    end
  end
end
