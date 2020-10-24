# frozen_string_literal: true

class Coaches::DashboardsController < Coaches::BaseController
  def index
    @bookings = current_coach.bookings.order(:time)
  end
end