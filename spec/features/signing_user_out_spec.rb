require 'rails_helper'

RSpec.feature 'Signing out a user' do
	before do
		@john = User.create(email: 'john@example.com', password: '11111111')
		visit '/'

		click_link 'Sign In'
		fill_in 'Email', with: @john.email
		fill_in 'Password', with: @john.password
		click_button 'Log in'
	end

	scenario 'Sign out' do
		visit '/'

		click_link 'Sign Out'
		expect(page).to have_content('Signed out successfully.')
	end
end