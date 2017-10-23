require 'rails_helper'

RSpec.feature "User edits an idea" do
  before {
    @category  = create(:category_with_ideas)
    @ideas     = @category.ideas
    @update_me = @ideas.last
  }

  scenario "a user updates an idea" do
    new_title = Faker::Name.title
    new_body  = Faker::Lorem.sentence

    visit category_idea_path(@category, @update_me)
    click_on 'Edit'

    fill_in "idea[title]", with: new_title
    fill_in "idea[body]",  with: new_body
    click_on "Update Idea"

    expect(current_path).to eq(category_idea_path(@category, @update_me))
    expect(page).to_not have_content(@update_me.title)
    expect(page).to_not have_content(@update_me.body)
  end
end