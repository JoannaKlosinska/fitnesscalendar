require 'test_helper'

class Customers::BookingsControllerTest < ActionController::TestCase
  def setup
    @user = customers(:one)
    @booking = bookings(:first)
    @coach = coaches(:first)
    sign_in @user
  end

  def test_index_of_customer_bookings
    get :index, params: { customer_id: @user }
    assert_response :success
  end

  def test_successful_destroy
    assert_difference('Booking.count', -1) do
      delete :destroy, params: { id: @booking.id, customer_id: @user, coach_id: @coach }
    end
    assert_redirected_to customer_bookings_path(customer_id: @user)
    assert_equal "Deleted", flash[:notice]
  end

  def test_unsuccessful_destroy
    assert_difference('Booking.count', 0) do
      delete :destroy, params: { id: 0, customer_id: @user, coach_id: @coach }
    end
    assert_redirected_to customer_bookings_path(customer_id: @user)
    assert_equal "Something went wrong...", flash[:alert]
  end
end 