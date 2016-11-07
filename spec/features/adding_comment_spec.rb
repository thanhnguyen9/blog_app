require 'rails_helper'

RSpec.feature 'Adding reviews to articles' do
	before do
		@john = User.create(email: 'john@example.com', password: '1111111')
		@fred = User.create(email: 'fred@example.com', password: '1111111')

		@article = Article.create(title: 'Title', body: 'Body', user: @john)
	end

	scenario 'Permit for user to write a review' do
		login_as @fred

		visit '/'
		click_link @article.title
		fill_in 'New Comment', with: 'Awesome article'
		click_button 'Add Comment'

		expect(page).to have_content("Comment has been created")
		expect(page).to have_content('Awesome article')
		expect(current_path).to eq(article_path(@article.comments.last.id))
	end
end