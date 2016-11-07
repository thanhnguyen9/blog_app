require 'rails_helper'

RSpec.feature 'Sign user in' do 

	before do
		@john = User.create(email: 'john@example.com', password: '11111111')
	end
	scenario 'Sign a user in' do
		visit '/'

		click_link 'Sign In'

		fill_in 'Email', with: @john.email
		fill_in 'Password', with: @john.password

		click_button 'Log in'

		expect(page).to have_content('Signed in successfully')
		expect(page).to have_content("Signed in as #{@john.email}")
	end
end