# frozen_string_literal: true

class Coaches::SchedulesController < Coaches::BaseController
  def show
    schedule = current_coach.schedule
    @schedule_presenter = SchedulePresenter.new(schedule)
  end
end

# Schedule
# Mon, Tue, Wed, Thu, Fri, Sat, Sun
# {
#   # 12 --> means 12-13
#   monday: [],
#   tuesday: [],
# }