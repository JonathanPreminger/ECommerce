# frozen_string_literal: true

Rails.application.routes.draw do
  get 'items/index'
  get 'items/show'

  devise_for :users, controllers: { sessions: "users/sessions", registrations: 'users/registrations' }

  devise_for :admins, controllers: { sessions: 'admins/sessions', confirmations: 'admins/confirmations', registrations: 'admins/registrations', passwords: 'admins/passwords', unlocks: 'admins/unlocks' }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  resources :administration, only: [:index]

  namespace 'administration' do
    resources :items, only: %i[index create new destroy update edit]
    resources :orders, only: %i[index update]
  end
end
