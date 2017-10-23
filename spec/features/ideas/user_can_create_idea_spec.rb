require 'rails_helper'

describe "User creates a new Idea" do
  before { @categories = create_list(:category, 5) }

  scenario "a user can create a new idea" do
    category = build(:category)

    visit new_idea_path

    fill_in "idea[title]", with: 'cool idea'
    fill_in "idea[body]",  with: 'pls work'

    within '#idea_category_id' do
      find("option[value='1']").select_option
    end
    click_button "Create Idea"

    expect(current_path).to eq("/ideas/#{Idea.last.id}")
    expect(page).to have_content("cool idea")
    expect(page).to have_content("pls work")
    expect(page).to have_content @categories.first.title
  end
end