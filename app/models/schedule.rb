class Schedule < ApplicationRecord
  DAYS = ["monday", "tuesday", "wednesday", "thursday", "friday", "saturday", "sunday"].freeze
  
  belongs_to :coach

  validate :expected_hours

  def days
    {
      "Mon" => monday,
      "Tue" => tuesday,
      "Wed" => wednesday,
      "Thu" => thursday,
      "Fri" => friday,
      "Sat" => saturday,
      "Sun" => sunday
    }
  end

  def abbr_to_day_names
    {
      "Mon" => "monday",
      "Tue" => "tuesday",
      "Wed" => "wednesday",
      "Thu" => "thursday",
      "Fri" => "friday",
      "Sat" => "saturday",
      "Sun" => "sunday"
    }
  end

  private

  def expected_hours
    DAYS.each do |day|
      if !public_send(day).is_a?(Array) || !public_send(day).all? { |hour| hour.to_i.in?(7..21) }
        errors.add(day, "Wrong hours input")
      end
    end
  end
end