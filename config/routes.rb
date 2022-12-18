# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show] do
      resources :comments, only: [:create]
      resource :like, only: [:create]
    end
  end
  root to: "users#index"
end
