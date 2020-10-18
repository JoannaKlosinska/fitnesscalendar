class Customer < User
  has_many :bookings, dependent: :destroy
end