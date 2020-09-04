module Users
  class BookingsController < ApplicationController
    before_action :authenticate_user!

    def index
      user = User.find_by(id: params[:user_id])
      @bookings = user.bookings.sort_by(&:time)
    end

    def destroy
      user = User.find_by(id: params[:user_id])
      booking = user.bookings.find_by(id: params[:id])
  
      if booking&.destroy
        flash[:notice] = "Deleted"
      else
        flash[:alert] = "Something went wrong..."
      end
    
      redirect_to user_bookings_path(user_id: current_user)
    end
  end
end