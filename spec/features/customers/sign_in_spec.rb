require "rails_helper"

feature 'Sign in' do

  scenario 'A user sign in successfully' do
    @user = User.create(name: 'Example User', email: 'example@mail.com', password: 'password',
                        password_confirmation: 'password')
    visit '/'

    click_on 'Sign in'

    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password

    click_button 'Sign in'

    expect(page).to have_content 'Signed in successfully.'
    expect(page).to have_link 'My bookings'
    expect(page).to have_link 'Edit profile'
    expect(page).to have_link 'Logout'
    expect(current_path). to eq(root_path)
  end

  scenario 'A user fails to sign in' do
    visit '/'

    click_on 'Sign in'

    fill_in 'Email', with: ''
    fill_in 'Password', with: ''

    click_button 'Sign in'

    expect(page).to have_content('Invalid Email or password.')
  end
end