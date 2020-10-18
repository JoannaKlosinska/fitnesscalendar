module Customers
  class BookingsController < ApplicationController
    before_action :authenticate_customer!

    def index
      user = Customer.find_by(id: params[:customer_id])
      @bookings = user.bookings.sort_by(&:time)
    end

    def destroy
      user = Customer.find_by(id: params[:customer_id])
      booking = user.bookings.find_by(id: params[:id])
  
      if booking&.destroy
        flash[:notice] = "Deleted"
      else
        flash[:alert] = "Something went wrong..."
      end
    
      redirect_to customer_bookings_path(customer_id: current_customer)
    end
  end
end