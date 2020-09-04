class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :timeoutable

  has_many :bookings, dependent: :destroy

  validates :email, presence: true
  validates :name, presence: true
  
end
