module Features
  def sign_in(email)
    visit '/'
    click_on 'Sign in'
    fill_in 'Email', with: email
    fill_in 'Password', with: 'password' 
    click_button 'Sign in'
  end

  def sign_in_coach(email)
    visit '/coach/sign_in'
    fill_in 'Email', with: email
    fill_in 'Password', with: 'password'
    click_button 'Sign in'
  end

  def sign_out
    click_link 'Logout'
  end
  alias_method :sign_out_coach, :sign_out
end