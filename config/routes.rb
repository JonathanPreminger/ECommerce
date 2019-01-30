# frozen_string_literal: true

Rails.application.routes.draw do
  get 'items/index'
  get 'items/show'

  get 'carts/show'

  devise_for :users, path: 'users', controllers: { sessions: "users/sessions" }
  devise_for :admins, path: 'admins', controllers: { sessions: "admins/sessions" }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  post 'cart_item', to: "cart_item#create"
  delete 'cart_items/:id', to: "cart_items#destroy", as: "cart_items_destroy"
  post 'cart_items/:id/add_quantity', to: "cart_items#add_quantity", as: "cart_items_add"
  post 'cart_items/:id/reduce_quantity', to: "cart_items#reduce_quantity", as: "cart_items_reduce"
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
end
