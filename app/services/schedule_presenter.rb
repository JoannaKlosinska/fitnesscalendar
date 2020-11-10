# frozen_string_literal: true

class SchedulePresenter
  attr_reader :schedule

  def initialize(schedule)
    @schedule = schedule
  end

  def week
    schedule.days.transform_values! do |hours|
      day(hours)
    end
  end

  def day(hours)
    # [0, 12, 15, 16]
    (7..21).to_a.map do |hour|
      booking_present = if hours.include?(hour.to_s)
        'YES'
      else
        'NO'
      end

      {
        hour: "#{hour}:00 - #{hour + 1}:00",
        booking: booking_present
      }
      # "#{hour}:00 - #{hour + 1}:00 - #{booking_present}"
      # 7:00 - 8:00 - YES/NO
    end
  end
end