require_relative '../spec_helper'
RSpec.describe 'user edit page' do
	it 'displays information about user being edited' do
		user = create_user('Kobe Bryant')
		visit "/users/#{user.id}/edit"
		expect(find_field('first_name').value).to eq(user.first_name)
		expect(find_field('last_name').value).to eq(user.last_name)
		expect(find_field('email').value).to eq(user.email)
	end
end