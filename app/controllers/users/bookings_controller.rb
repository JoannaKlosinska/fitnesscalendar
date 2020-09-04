module Users
  class BookingsController < ApplicationController
    def index
      user = User.find_by(id: params[:user_id])
      @bookings = user.bookings.sort_by(&:time)
    end

    def destroy
      user = User.find_by(id: params[:user_id])
      booking = user.bookings.find_by(id: params[:id])
  
      if booking&.destroy
        flash[:success] = "Deleted"
      else
        flash[:danger] = "Something went wrong..."
      end
    
      redirect_to user_bookings_path(user_id: current_user)
    end
  end
end