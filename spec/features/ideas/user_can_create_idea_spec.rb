require 'rails_helper'

describe "User creates a new Idea" do
  let!(:categories)   { create_list(:category, 5) }
  let!(:default_user) { User.create(username: 'default', password: 'whatever') }

  scenario "a logged in user can create a new idea" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(default_user)

    visit user_path(default_user)
    click_on "Create Idea"

    expect(current_path).to eq(new_user_idea_path(default_user))

    fill_in "idea[title]", with: 'cool idea'
    fill_in "idea[body]",  with: 'pls work'

    within '#idea_category_id' do
      find("option[value='1']").select_option
    end

    click_button "Create Idea"

    expect(current_path).to eq(user_idea_path(default_user, Idea.last))
    expect(page).to have_content("cool idea")
    expect(page).to have_content("pls work")
    expect(page).to have_content categories.first.title
  end
end