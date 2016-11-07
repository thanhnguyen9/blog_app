require 'rails_helper'

RSpec.feature 'Listing Articles' do
	before do
		@article_1 = Article.create(title: 'First artice', body: 'First body')
		@article_2 = Article.create(title: 'Second artice', body: 'Second body')
	end

	scenario 'List out all of articles' do
		visit '/'

		expect(page).to have_content(@article_1.title)
		expect(page).to have_content(@article_1.body)
		expect(page).to have_content(@article_2.title)
		expect(page).to have_content(@article_2.body)
		expect(page).to have_link(@article_1.title)
		expect(page).to have_link(@article_2.title)
end
end