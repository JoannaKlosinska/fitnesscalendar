# frozen_string_literal: true

class Coaches::DashboardsController < Coaches::BaseController
  def index
    @bookings = current_coach.bookings.order(:time).paginate(page: params[:page], per_page: 6)
  end
end