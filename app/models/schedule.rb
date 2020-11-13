class Schedule < ApplicationRecord
  belongs_to :coach

  def days
    {
      'Mon' => monday,
      'Tue' => tuesday,
      'Wed' => wednesday,
      'Thu' => thursday,
      'Fri' => friday,
      'Sat' => saturday,
      'Sun' => sunday
    }
  end

  def abbr_to_day_names
    {
      'Mon' => 'monday',
      'Tue' => 'tuesday',
      'Wed' => 'wednesday',
      'Thu' => 'thursday',
      'Fri' => 'friday',
      'Sat' => 'saturday',
      'Sun' => 'sunday'
    }
  end
end