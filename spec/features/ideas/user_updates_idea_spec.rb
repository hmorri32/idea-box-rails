require 'rails_helper'

RSpec.feature "User edits an idea" do
  let!(:default_user) { User.create(username: 'default', password: 'whatever') }

  before {
    @category  = create(:category_with_ideas)
    @ideas     = @category.ideas
    @update_me = @ideas.last
  }

  scenario "a user updates an idea" do
    category = build(:category)
    idea = default_user.ideas.create(title: 'cool idea', body: 'whatever', category: category)
    idea2 = default_user.ideas.create(title: 'another one', body: 'plz', category: category)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(default_user)

    new_title = Faker::Name.title
    new_body  = Faker::Lorem.sentence

    visit user_idea_path(default_user, idea)
    click_on 'Edit'

    fill_in "idea[title]", with: new_title
    fill_in "idea[body]",  with: new_body
    click_on "Update Idea"

    expect(current_path).to eq(user_idea_path(default_user, idea))
    expect(page).to_not have_content(idea.title)
    expect(page).to_not have_content(idea.body)
  end
end