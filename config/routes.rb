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
  delete 'cart_item.:id', to: "cart_item#destroy"
  post 'cart_item/:id/add' => "cart_item#add_quantity", as: "cart_item_add"
  post 'cart_item/:id/reduce' => "cart_item#reduce_quantity", as: "cart_item_reduce"
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
end
