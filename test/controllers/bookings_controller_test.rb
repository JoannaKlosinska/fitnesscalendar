require 'test_helper'

class BookingsControllerTest < ActionController::TestCase
  def setup
    sign_in users(:one)
    @booking = bookings(:first)
  end

  def test_correct_date_for_index_of_bookings
    get :index, params: { date: Date.tomorrow }

    assert_response :success    
  end

  def test_creating_a_booking_with_valid_params
    assert_difference('Booking.count', 1) do
      post :create, params: { booking: { time: Date.tomorrow.strftime("%Y-%m-%dT%H:%M") } }
    end
    assert_redirected_to bookings_path(date: Date.tomorrow.strftime("%Y-%m-%d"))
  end

  def test_creating_a_booking_with_invalid_params
    assert_difference('Booking.count', 0) do
      post :create, params: { booking: { time: nil } }
    end
    assert_redirected_to bookings_path
    assert_equal "Something went wrong...", flash[:alert]
  end

   def test_successful_destroy
    assert_difference('Booking.count', -1) do
      delete :destroy, params: { id: @booking.id }
    end
    assert_redirected_to bookings_path(date: @booking.time.strftime("%Y-%m-%d"))
    assert_equal "Deleted", flash[:notice]
   end

  def test_unsuccessful_destroy
    assert_difference('Booking.count', 0) do
      delete :destroy, params: { id: 0 }
    end
    assert_redirected_to bookings_path
    assert_equal "Something went wrong...", flash[:alert]
  end
end
