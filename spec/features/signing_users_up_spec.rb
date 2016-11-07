require 'rails_helper'

RSpec.feature 'User sign up' do
	scenario 'with valid credentail' do
		visit '/'

		click_link 'Sign Up'

		fill_in "Email", with: 'user@example.com'
		fill_in 'Password', with: '11111111'
		fill_in 'Password confirmation', with: '11111111'

		click_button 'Sign up'

		expect(page).to have_content('Welcome! You have signed up successfully.')
	end
end