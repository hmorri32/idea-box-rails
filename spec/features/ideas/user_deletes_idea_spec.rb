require 'rails_helper'

RSpec.feature 'User deletes an Idea' do

  before {
    @category  = create(:category_with_ideas)
    @ideas     = @category.ideas
    @delete_me = @ideas.last
  }

  scenario "user deletes an idea" do
    expect(@ideas.count).to eq(10)

    visit idea_path(@delete_me)
    click_on "Delete"

    expect(@ideas.count).to eq(9)
    expect(current_path).to eq ideas_path
    expect(page).to_not have_content @delete_me.title
  end
end