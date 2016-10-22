require 'rails_helper'

RSpec.feature "Creating Article" do
  scenario "A user creates a new article" do
    visit "/"

    click_link "New article"

    fill_in "Title", with: "Creating first article"
    fill_in "Body", with: "Lorem Ipsum"
    click_button "Create Article"

    expect(page).to have_content("Article has been created")
    expect(page.current_path).to eq(articles_path)
  end
end