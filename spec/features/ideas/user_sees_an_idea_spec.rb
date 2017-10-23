require 'rails_helper'

RSpec.feature "User sees a specific idea" do
  scenario "user sees a specific idea" do
    category = create(:category_with_ideas)
    idea     = category.ideas.first

    visit category_idea_path(category, idea)

    expect(page).to have_content idea.title
    expect(page).to have_content idea.body
    expect(page).to have_content idea.category.title
  end
end