Rails.application.routes.draw do
  devise_for :users
  root to: 'pools#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :pools, :bookings
  resources :bookings do
    :reviews
  end
end
