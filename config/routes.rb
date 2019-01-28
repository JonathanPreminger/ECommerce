# frozen_string_literal: true

Rails.application.routes.draw do
  get 'items/index'
  get 'items/show'

  get 'carts/show'

  devise_for :users, path: 'users', controllers: { sessions: "users/sessions" }
  devise_for :admins, path: 'admins', controllers: { sessions: "admins/sessions" }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
end
