module Features
  def sign_in(email)
    visit '/'
    click_on 'Sign in'
    fill_in 'Email', with: email
    fill_in 'Password', with: 'password' 
    click_button 'Sign in'
  end
end