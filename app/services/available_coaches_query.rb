class AvailableCoachesQuery
  def self.at(booking_datetime)
    Coach.joins(:schedule)
         .where("schedules.#{booking_datetime.strftime("%A").downcase} && ?", "{#{booking_datetime.hour}}")
         .where.not(
           id: Coach.joins(:bookings).where(bookings: { time: booking_datetime })
         )
  end
end