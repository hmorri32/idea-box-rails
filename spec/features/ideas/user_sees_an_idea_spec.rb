require 'rails_helper'

RSpec.feature "User sees a specific idea" do
  let!(:default_user) { User.create(username: 'default',  password: 'whatever') }
  let!(:another_user) { User.create(username: 'imposter', password: 'whatever') }

  context 'as a logged in user' do
    scenario "user sees its own specific idea" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(default_user)

      category = build(:category)
      idea = default_user.ideas.create(title: 'cool idea', body: 'whatever', category: category)

      visit user_idea_path(default_user, idea)

      expect(page).to have_content idea.title
      expect(page).to have_content idea.body
      expect(page).to have_content idea.category.title
    end

    scenario "user cannot see other users ideas" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(another_user)

      category = build(:category)
      idea = another_user.ideas.create(title: 'cool idea', body: 'whatever', category: category)

      visit user_idea_path(another_user, idea)
      expect(page).to have_content idea.title

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(default_user)

      visit user_ideas_path(default_user)
      expect(page).to_not have_content idea.title
    end
  end
end