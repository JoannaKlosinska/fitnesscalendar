class Booking < ApplicationRecord
  validates :time, presence: true
end