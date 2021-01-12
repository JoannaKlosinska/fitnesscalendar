require "rails_helper"

feature 'Coach sign in' do
  background do
    Coach.create(name: 'Sample Coach', email: 'coach@mail.com', password: 'password123',
                password_confirmation: 'password123')
  end
  scenario 'A coach sign in successfully' do
    visit '/coach/sign_in'

    fill_in 'Email', with: 'coach@mail.com'
    fill_in 'Password', with: 'password123'

    click_button 'Sign in'

    expect(page).to have_content('My Trainings')
    expect(page).to have_link 'Schedule'
    expect(page).to have_link 'Edit profile'
    expect(page).to have_link 'Logout'
    expect(current_path).to eq(coach_dashboards_path)
  end
  scenario 'A coach fails sign in' do
    visit '/coach/sign_in'

    fill_in 'Email', with: ''
    fill_in 'Password', with: ''

    click_button 'Sign in'

    expect(page).to have_content('You need to sign in or sign up before continuing.')
  end
end