Rails.application.routes.draw do
  # get 'users/index'
  # get 'posts/index'
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show]
  end
  root to: "home#index"
end
