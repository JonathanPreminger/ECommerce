# frozen_string_literal: true

Rails.application.routes.draw do
  get 'items/index', to: "items#index", as: "items_index"
  get 'items/:id/show', to: "items#show", as: "items_show"
  get 'items/filter', to: "items#filter", as: "items_filter"

  get 'carts/show'
  devise_for :users, controllers: { sessions: "users/sessions", registrations: 'users/registrations' }

  resource :users do
    resources :orders, only: %i[new create index show]
  end

  devise_for :admins, controllers: { sessions: 'admins/sessions', confirmations: 'admins/confirmations', registrations: 'admins/registrations', passwords: 'admins/passwords', unlocks: 'admins/unlocks' }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  post 'cart_items/:item_id', to: "cart_items#create", as: "cart_items"
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
