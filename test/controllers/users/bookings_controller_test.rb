require 'test_helper'

class Users::BookingsControllerTest < ActionController::TestCase
  def setup
    @user = users(:one)
    @booking = bookings(:first)
    sign_in @user
  end

  def test_index_of_user_bookings
    get :index, params: { user_id: @user }
    assert_response :success
  end

  def test_successful_destroy
    assert_difference('Booking.count', -1) do
      delete :destroy, params: { id: @booking.id, user_id: @user }
    end
    assert_redirected_to user_bookings_path(user_id: @user)
    assert_equal "Deleted", flash[:notice]
  end

  def test_unsuccessful_destroy
    assert_difference('Booking.count', 0) do
      delete :destroy, params: { id: 0, user_id: @user }
    end
    assert_redirected_to user_bookings_path(user_id: @user)
    assert_equal "Something went wrong...", flash[:alert]
  end
end 