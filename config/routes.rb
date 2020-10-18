Rails.application.routes.draw do
  devise_for :customers, path: 'users', controllers: { 
    sessions: 'customers/sessions', 
    confirmations: 'customers/confirmations'
  }

  root to: "dashboards#index"

  resources :customers, path: 'users' do
    resources :bookings, only: [:index, :destroy], controller: 'customers/bookings'
  end
  resources 'dashboards', only: [:index]
  resources 'bookings', only: [:index, :create, :destroy]

  devise_for :coaches, path: '/coach', controllers: {
    sessions: 'coaches/sessions', 
    confirmations: 'coaches/confirmations'
  }

  scope :coach do
    resources :dashboards, only: [:index], controller: 'coaches/dashboards', as: 'coach_dashboards'

    # resource :bookings
  end
end
