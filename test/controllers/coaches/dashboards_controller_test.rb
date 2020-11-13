require 'test_helper'

class Coaches::DashboardsControllerTest < ActionController::TestCase

  def setup
    @coach = coaches(:first)
    sign_in @coach
  end

  def test_index_of_coach_bookings
    get :index, params: { coach_id: @coach }
    assert_response :success
  end
end
