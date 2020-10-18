class Booking < ApplicationRecord
  belongs_to :customer

  validates :time, presence: true
  validates :customer_id, presence: true
  validates :coach.name, presence: true
  
end