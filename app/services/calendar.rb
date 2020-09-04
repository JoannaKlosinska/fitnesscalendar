class Calendar
  def initialize(month:, year:)
    @month = month
    @year = year
  end

  attr_reader :month, :year

  def date(day)
    Date.new(year, month, day)
  end

  def month_humanized
    Date.new(year, month).strftime('%B')
  end

  def build_array_of_weeks_for
    beginning_of_month = Date.new(year, month)
    beginning_of_month_cwday = beginning_of_month.cwday
    arr = []

    (beginning_of_month_cwday - 1).times { arr << 0 }
    (beginning_of_month..beginning_of_month.end_of_month).each { |date| arr << date.day }
    arr.each_slice(7).to_a
  end
end