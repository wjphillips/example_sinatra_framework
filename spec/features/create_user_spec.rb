require_relative '../spec_helper'
RSpec.describe 'creating user' do
	it 'creates a new user and redirects to the users page' do
		visit '/users/new'
		fill_in 'email', with: 'kobe@lakers.com'
		fill_in 'first_name', with: 'Kobe'
		fill_in 'last_name', with: 'Bryant'
		fill_in 'password', with: 'password'
		fill_in 'password_confirmation', with: 'password'
		click_button 'Create Account'
		expect(current_path).to eq('/users')
		expect(page).to have_text('Kobe')
	end
end