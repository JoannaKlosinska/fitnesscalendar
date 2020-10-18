class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :timeoutable

  validates :email, presence: true
  validates :name, presence: true
  
  # kind [:customer, :coach]
end
