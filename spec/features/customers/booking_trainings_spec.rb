require "rails_helper"

feature 'Booking' do

  scenario 'A user successfully book a training' do
    sign_in

    visit '/'

  end
end