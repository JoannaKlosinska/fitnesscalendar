# frozen_string_literal: true

class Coaches::SchedulesController < Coaches::BaseController
  def show
    @schedule = current_coach.schedule
    @schedule_presenter = SchedulePresenter.new(@schedule)
  end

  def update
    @schedule = current_coach.schedule
    
    if @schedule.update(schedule_params)
      redirect_to schedule_path, notice: 'Updated!'
    else
      @schedule_presenter = SchedulePresenter.new(@schedule)

      render :show # display errors in the view
    end
  end

  private

  def schedule_params
    params.require(:schedule)
          .permit(monday: [], tuesday: [], wednesday: [], thursday: [], friday: [], saturday: [], sunday: [])
  end
end

