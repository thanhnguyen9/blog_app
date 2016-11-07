require 'rails_helper'

RSpec.feature 'Edite article' do
	before do
		john = User.create(email: 'john@example.com', password: '11111111')
		login_as(john)
		@article = Article.create(title: 'Title', body: 'Body', user: john)
	end	

	scenario 'A user update an article' do
		visit '/'

		click_link @article.title
		click_link 'Edit article'

		fill_in 'Title', with: 'Update title'
		fill_in 'Body', with: 'Update body'

		click_button 'Update Article'

		expect(page).to have_content('Article has been updated')
		expect(page.current_path).to eq(article_path(@article))
	end

	scenario 'User fails to update article' do
		visit '/'

		click_link @article.title
		click_link 'Edit article'

		fill_in 'Title', with: ''
		fill_in 'Body', with: 'Update body'

		click_button 'Update Article'

		expect(page).to have_content('Article has not been updated')
		expect(page.current_path).to eq(article_path(@article))
	end
end