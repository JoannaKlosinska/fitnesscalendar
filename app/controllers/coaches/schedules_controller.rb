# frozen_string_literal: true

class Coaches::SchedulesController < Coaches::BaseController
  def show
    schedule = current_coach.schedule
    @schedule_presenter = SchedulePresenter.new(schedule)
  end
end

