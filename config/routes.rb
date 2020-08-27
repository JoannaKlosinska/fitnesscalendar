Rails.application.routes.draw do
  devise_for :users, :controllers => { 
    sessions: 'users/sessions', 
    confirmations: 'users/confirmations' }
  root to: "dashboards#index"

  resources :users do
    resources :bookings, only: [:index, :destroy], controller: 'users/bookings'
  end
  resources 'dashboards', only: [:index]
  resources 'bookings', only: [:index, :create, :destroy]
end
