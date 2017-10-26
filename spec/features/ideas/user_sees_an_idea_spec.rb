require 'rails_helper'

RSpec.feature "User sees a specific idea" do
  let!(:default_user) { User.create(username: 'default', password: 'whatever') }

  scenario "user sees a specific idea" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(default_user)

    category = create(:category_with_ideas)
    idea     = category.ideas.first

    visit user_idea_path(default_user, idea)

    expect(page).to have_content idea.title
    expect(page).to have_content idea.body
    expect(page).to have_content idea.category.title
  end
end