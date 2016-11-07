require 'rails_helper'

RSpec.feature 'Showing article' do

	before do
		@john = User.create(email: 'john@example.com', password: '11111111')
		@fred = User.create(email: 'fred@example.com', password: '11111111')
		@article = Article.create(title: 'Title 1', body: 'Body 1', user: @john)
	end

	scenario 'A non-signed in user does not see edit and delet link' do 
		visit '/'

		click_link @article.title

		expect(page).to have_content(@article.title)
		expect(page).to have_content(@article.body)
		expect(current_path).to eq(article_path(@article))

		expect(page).not_to have_link('Edit article')
		expect(page).not_to have_link('Delete Article')
	end

	scenario 'A non-owner signed in can not see both links' do
		login_as @fred

		visit '/'

		click_link @article.title

		expect(page).not_to have_link('Edit article')
		expect(page).not_to have_link('Delete Article')
	end

	scenario 'A signed in owner see both links' do
		login_as(@john)

		visit '/'

		click_link @article.title

		expect(page).to have_content(@article.title)
		expect(page).to have_content(@article.body)
		expect(current_path).to eq(article_path(@article))

		expect(page).to have_link('Edit article')
		expect(page).to have_link('Delete Article')
	end

	scenario 'Showing article' do 
		visit '/'

		click_link @article.title

		expect(page).to have_content(@article.title)
		expect(page).to have_content(@article.body)
		expect(current_path).to eq(article_path(@article))
	end
end