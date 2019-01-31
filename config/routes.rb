# frozen_string_literal: true

Rails.application.routes.draw do
  get 'items/index'
  get 'items/:id/show', to: "items#show", as: "items_show"

  get 'carts/show'

  devise_for :users, controllers: { sessions: "users/sessions", registrations: 'users/registrations' }

  devise_for :admins, controllers: { sessions: 'admins/sessions', confirmations: 'admins/confirmations', registrations: 'admins/registrations', passwords: 'admins/passwords', unlocks: 'admins/unlocks' }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  post 'cart_item', to: "cart_item#create"
  delete 'cart_items/:id', to: "cart_items#destroy", as: "cart_items_destroy"
  post 'cart_items/:id/add_quantity', to: "cart_items#add_quantity", as: "cart_items_add"
  post 'cart_items/:id/reduce_quantity', to: "cart_items#reduce_quantity", as: "cart_items_reduce"
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  resources :administration, only: [:index]

  namespace 'administration' do
    resources :items, only: %i[index create new destroy update edit]
    resources :orders, only: %i[index update edit show]
  end
end
