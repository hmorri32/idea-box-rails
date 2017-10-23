require 'rails_helper'

RSpec.describe Idea, type: :model do
  it 'should have a quality and it should default to 0' do
    idea = Idea.new
    expect(idea.quality).to eq(0)
  end

  describe 'validations' do
    it 'should be invalid without title' do
      category = Category.create(title: 'cool')
      idea_sans_title = Idea.new(body: 'suh', category: category)
      expect(idea_sans_title).to be_invalid
    end

    it 'should be invalid without body' do
      category = Category.create(title: 'cool')
      idea_sans_body = Idea.new(title: 'suh', category: category)
      expect(idea_sans_body).to be_invalid
    end
  end

  it 'should be invalid without a title and a body' do
    category = Category.create(title: 'cool')
    idea_sans_erthang = Idea.new
    expect(idea_sans_erthang).to be_invalid
  end

  it 'should be valid given all params' do
    category = Category.create(title: 'cool')
    idea = Idea.new(title: 'cool idea', body: 'totally', category: category)
    expect(idea).to be_valid
  end
end
