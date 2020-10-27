Rails.application.routes.draw do
  get 'cards/new'
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  root to: 'items#index'
  
  resources :items do
    resources :orders, only: [:index, :create]
    resources :messages, only: [:create]
    collection do
      get 'search'
    end
    post 'order', on: :member
  end

  resources :users, only: [:edit, :update, :new, :create, :show]
  resources :cards, only: [:new, :create]
end
