require_relative '../spec_helper'
RSpec.describe 'new user' do
	it 'displays correct fields to create a new user' do
		visit '/users/new'
		expect(page.status_code).to eq(200)
		expect(page).to have_field('email')
		expect(page).to have_field('first_name')
		expect(page).to have_field('last_name')
		expect(page).to have_field('password')
		expect(page).to have_field('password_confirmation')
	end
end