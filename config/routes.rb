# frozen_string_literal: true

Rails.application.routes.draw do
  get 'home/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
end
