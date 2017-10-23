require 'rails_helper'

RSpec.feature 'delete Idea' do

  before {
    @category  = create(:category_with_ideas)
    @ideas     = @category.ideas
    @delete_me = @ideas.last
  }

  scenario "user deletes an idea" do
    expect(@ideas.count).to eq(10)

    visit category_idea_path(@category, @delete_me)
    click_on "Delete"

    expect(@ideas.count).to eq(9)
    expect(current_path).to eq category_ideas_path(@category)
    expect(page).to_not have_content @delete_me.title
  end
end