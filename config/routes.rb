Rails.application.routes.draw do
  devise_for :users
  root to: 'pools#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
    collection do
      get "dashboard"
    end
  end
  resources :pools do
    resources :bookings, only:[:create]
  end

  resources :bookings, only: [ :show, :edit, :update, :destroy ] do
    resources :reviews, only: [ :create ]
  end

  resources :reviews, only: [:edit, :update, :destroy]
end
