require 'rails_helper'

feature 'Booking' do
  fixtures(:customers, :coaches)

  scenario 'A user successfully book a training' do
    Timecop.freeze(Date.new(2021, 1, 11)) do
      Schedule.create(coach: Coach.first, monday: ['10'])

      sign_in('foo@bar.com')

      visit '/'
      click_link '11'
      within(find('li', text: '10:00')) do
        select 'Foo Baz', from: 'booking_coach_id'
        click_on 'BOOK'
      end
      
      expect(page).to have_content 'Booked!'
      within(find('li', text: '10:00')) do
        expect(page).to have_content 'Booked'
        expect(page).not_to have_content 'BOOK'
      end
    end
  end
  
  scenario 'A user fails book a trainig' do
    Timecop.freeze(Date.new(2021, 1, 12)) do
      Schedule.create(coach: Coach.first, tuesday: ['11'])

      sign_in('foo@bar.com')

      visit '/'
      click_link '12'
      within(find('li', text: '11:00')) do
        click_on 'BOOK'
      end

      expect(page).to have_content 'Choose your coach'
      within(find('li', text: '11:00')) do
        expect(page).not_to have_content 'Booked'
        expect(page).to have_content 'BOOK'
      end
    end
  end

  scenario 'A user cannot book a training' do
    Timecop.freeze(Date.new(2021, 1, 13)) do

      visit '/'
      click_link '13'

      expect(page).to have_button('BOOK', disabled: true)
      expect(page).not_to have_select
    end
  end
end