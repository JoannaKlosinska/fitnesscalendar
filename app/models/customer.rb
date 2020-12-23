class Customer < User
  devise :omniauthable, omniauth_providers: [:google_oauth2]

  has_many :bookings, dependent: :destroy

  def self.from_google(email:, full_name:, uid:)
    user = self.find_by(email: email, uid: uid)
    
    unless user
      password = Devise.friendly_token[0, 20]
      user = self.create(
        uid: uid,
        name: full_name,
        email: email,
        password: password,
        password_confirmation: password,
        confirmed_at: Time.zone.now
      )
    end

    user if user.persisted?
  end
end
