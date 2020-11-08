class Coach < User
  has_many :bookings
  has_one :schedule

  after_create :create_coach_schedule

  private

  def create_coach_schedule
    # create_schedule
    Schedule.create(coach: self)
  end
end