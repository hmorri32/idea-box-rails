require 'rails_helper'

describe "User creates a new Idea" do
  scenario "a user can create a new idea" do
    category = build(:category)

    visit new_idea_path

    fill_in "idea[title]", with: 'cool idea'
    fill_in "idea[body]", with: 'pls work'
    
  end
end
