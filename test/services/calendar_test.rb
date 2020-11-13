require 'test_helper'

class CalendarTest < MiniTest::Unit::TestCase
  def setup
    # 31 days, 1st is Wed
    @calendar = Calendar.new(month: 1, year: 2020)
  end

  def test_that_correct_array_of_weeks_is_returned
    assert_equal(
      [
        [0, 0, 1, 2, 3, 4, 5],
        [6, 7, 8, 9, 10, 11, 12],
        [13, 14, 15, 16, 17, 18, 19],
        [20, 21, 22, 23, 24, 25, 26],
        [27, 28, 29, 30, 31]
      ],
      @calendar.build_array_of_weeks_for
    )
  end
end
