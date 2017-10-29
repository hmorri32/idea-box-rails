require 'rails_helper'

RSpec.feature "user sees all ideas" do
  let!(:default_user) { User.create(username: 'default', password: 'whatever') }

  scenario "user visits index and sees all ideas" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(default_user)


    category = build(:category)
    idea     = default_user.ideas.create(title: 'cool idea', body: 'whatever', category: category)

    visit user_ideas_path(default_user)

    expect(page).to have_content(idea.title)
    expect(page).to have_content(idea.body)
    # expect(page).to have_content(@ideas.last.title)
    # expect(page).to have_content(@ideas.last.body)
  end
end