require 'rails_helper'

feature 'Schedule' do
  fixtures(:coaches)

  scenario 'A coach update a schedule successfully' do
    Schedule.create(coach: Coach.first)

    sign_in_coach('foo@baz.com')
    click_link 'Schedule'
    within(find('tr', text: '10:00 - 11:00')) do
      first("input[type='checkbox']").set(true)
    end
    click_on 'Update'
    expect(page).to have_content 'Updated!'
    expect(current_path). to eq(schedule_path)
  end
end