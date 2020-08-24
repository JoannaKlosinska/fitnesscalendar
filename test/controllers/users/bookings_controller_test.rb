# require 'test_helper'

# class BookingsControllerTest < ActionController::TestCase

# def setup
#   @user = users(:one)
#   @booking = bookings(:first)
# end

# def test_index_of_user_bookings
#   log_in_as @user
#   get @user_bookings_path(user_id: @user)
#   assert_response :success
# end

# def test_successful_destroy
#   log_in_as @user
#   assert_difference('Booking.count', -1) do
#     delete :destroy, params: { }
#   end
#   assert_redirected_to user_bookings_path(user_id: @user)
#   assert_equal "Deleted", flash[:success]