class BookingsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  
  def index
    @date = params[:date]&.to_date || Date.today
    # @date = params[:date] && params[:date].to_date || Date.today
    @booking = Booking.new
  end

  def create
    @booking = current_user.bookings.build(booking_params)
    if @booking.save
      flash[:success] = "Booked!"
    else
      flash[:danger] = "Something went wrong..."
    end
    redirect_to bookings_path(date: @booking.time&.strftime("%Y-%m-%d"))
  end

  def destroy
    booking = current_user.bookings.find_by(id: params[:id])
    date = booking&.time&.strftime("%Y-%m-%d")

    if booking&.destroy
      flash[:success] = "Deleted"
    else
      flash[:danger] = "Something went wrong..."
    end
  
    redirect_to bookings_path(date: date)
  end

  private

  def booking_params
    params.require(:booking).permit(:time)
  end
end
