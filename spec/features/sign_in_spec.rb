require_relative '../spec_helper'
RSpec.describe 'signing in' do
  before do
    @user = create_user('Kobe Bryant')
    visit '/sessions/new'
    expect(page.status_code).to eq(200)
  end
  it "prompts for username and password" do
    expect(page).to have_field("email")
    expect(page).to have_field("password")
  end
  it "signs in the user if the email/password combination is valid" do
    fill_in "email", with: @user.email
    fill_in "password", with: "password"
    click_button 'Log In'
    expect(page).to have_text("#{@user.first_name}")
  end
  it "doesn't sign in user if the email/password combination is invalid" do
    fill_in "email", with: @user.email
    fill_in "password", with: "wrongpassword"
    click_button 'Log In'
    expect(page).to have_text('Invalid')
  end
end