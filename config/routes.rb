Rails.application.routes.draw do
  root 'dashboards#index'

  resources 'dashboards', only: [:index]
  resources 'bookings', only: [:index, :create, :destroy]
end
