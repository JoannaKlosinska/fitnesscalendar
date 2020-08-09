class BookingsController < ApplicationController
  def index
    @date = params[:date]&.to_date || Date.today
    # @date = params[:date] && params[:date].to_date || Date.today
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      flash[:success] = "Booked!"
    else
      flash[:danger] = "Something went wrong..."
    end
    redirect_to bookings_path(date: @booking.time&.strftime("%Y-%m-%d"))
  end

  def destroy
    booking = Booking.find_by(id: params[:id])
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
