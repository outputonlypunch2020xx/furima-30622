Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items do
  end
  resources :users, only: [:edit, :update]
  resources :items, only: [:index, :new, :create, :show]
end
