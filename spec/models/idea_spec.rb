require 'rails_helper'

RSpec.describe Idea, type: :model do
  before :each { @category = build(:category) }

  it 'should have a quality and it should default to 0(junk)' do
    idea = Idea.new
    expect(idea.quality).to eq('junk')
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:body) }
    it { should define_enum_for(:quality) }

    it 'should be invalid without a title and a body' do
      idea_sans_erthang = Idea.new
      expect(idea_sans_erthang).to be_invalid
    end

    it 'should be valid given all params' do
      idea = Idea.new(title: 'cool idea', body: 'totally', category: @category)
      expect(idea).to be_valid
    end
  end

  describe "relationships" do
    it { should belong_to(:category) }
    it { should respond_to(:category) }
    it { should have_many(:images).through(:idea_images) }
    it { should have_many(:idea_images) }
  end
end
