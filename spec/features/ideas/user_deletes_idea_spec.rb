require 'rails_helper'

RSpec.feature 'delete Idea' do
  let!(:default_user) { User.create(username: 'default', password: 'whatever') }

  before {
    @category  = create(:category_with_ideas)
    @ideas     = @category.ideas
    @delete_me = @ideas.last
  }

  scenario "user deletes an idea" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(default_user)
    expect(@ideas.count).to eq(10)

    visit user_idea_path(default_user, @delete_me)
    click_on "Delete"

    expect(@ideas.count).to eq(9)
    expect(current_path).to eq user_ideas_path(default_user)
    expect(page).to_not have_content @delete_me.title
  end
end