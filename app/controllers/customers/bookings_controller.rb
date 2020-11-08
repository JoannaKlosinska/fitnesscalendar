module Customers
  class BookingsController < ApplicationController
    before_action :authenticate_customer!

    def index
      customer = set_customer

      if customer != current_customer
        flash[:notice] = "You do not have access"
        redirect_to dashboards_path
      end

      @bookings = customer.bookings.order(:time)
    end

    def destroy
      customer = set_customer
      booking = customer.bookings.find_by(id: params[:id])
  
      if booking&.destroy
        flash[:notice] = "Deleted"
      else
        flash[:alert] = "Something went wrong..."
      end
    
      redirect_to customer_bookings_path(customer_id: current_customer)
    end

    private

    def set_customer
      Customer.find_by(id: params[:customer_id])
    end
  end
end