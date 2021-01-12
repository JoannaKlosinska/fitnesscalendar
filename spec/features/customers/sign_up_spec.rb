require "rails_helper"

feature 'Sign up' do
  scenario 'A user sign up successfully' do
    visit '/'

    click_on 'Sign up'

    fill_in 'Name', with: 'Example User'
    fill_in 'Email', with: 'example@mail.com'
    fill_in 'Password (minimum 6 characters)', with: 'password'
    fill_in 'Password confirmation', with: 'password'

    click_button "Sign up"

    expect(page).to have_content('Welcome! You have signed up successfully.')
    expect(page).to have_link('My bookings')
    expect(page).to have_link('Edit profile')
    expect(page).to have_link('Logout')
    expect(current_path). to eq(root_path)
  end

  scenario 'A user fails to sign up' do
    visit '/'

    click_on 'Sign up'

    fill_in 'Name', with: ''
    fill_in 'Email', with: ''
    fill_in 'Password (minimum 6 characters)', with: 'password'
    fill_in 'Password confirmation', with: 'password'

    click_button "Sign up"

    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content("Email can't be blank")
  end
end