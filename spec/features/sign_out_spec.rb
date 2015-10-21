require_relative '../spec_helper'
RSpec.describe 'signing out' do
	it 'signs out the user and redirects to the login page' do
		user = create_user('Kobe Bryant')
		sign_in(user)
		visit "/users"
		click_button 'Log Out'
		expect(current_path).to eq("/sessions/new")
	end
end