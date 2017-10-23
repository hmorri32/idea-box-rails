require 'rails_helper'

RSpec.feature "user sees all ideas" do
  before {
    @category  = create(:category_with_ideas)
    @ideas     = @category.ideas
  }

  scenario "user visits index and sees all ideas" do
    visit '/'

    expect(page).to have_content(@ideas.first.title)
    expect(page).to have_content(@ideas.first.body)
    expect(page).to have_content(@ideas.last.title)
    expect(page).to have_content(@ideas.last.body)
  end
end