require 'rails_helper'

RSpec.feature "User edits an idea" do
  let!(:default_user) { User.create(username: 'default', password: 'whatever') }

  before {
    @category  = create(:category_with_ideas)
    @ideas     = @category.ideas
    @update_me = @ideas.last
  }

  scenario "a user updates an idea" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(default_user)

    new_title = Faker::Name.title
    new_body  = Faker::Lorem.sentence

    visit user_idea_path(default_user, @update_me)
    click_on 'Edit'

    fill_in "idea[title]", with: new_title
    fill_in "idea[body]",  with: new_body
    click_on "Update Idea"

    expect(current_path).to eq(user_idea_path(default_user, @update_me))
    expect(page).to_not have_content(@update_me.title)
    expect(page).to_not have_content(@update_me.body)
  end
end