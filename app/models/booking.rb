class Booking < ApplicationRecord
  belongs_to :customer
  belongs_to :coach

  validates :time, presence: true
  validates :customer_id, presence: true
  validates :coach_id, presence: true
  # validates :coach_name, presence: true
end