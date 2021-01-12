module Features
  def sign_in
    visit '/'
    click_on 'Sign in'
    fill_in 'Email', with: 'example@mail.com'
    fill_in 'Password', with: 'password' 
    click_button 'Sign in'
  end
end