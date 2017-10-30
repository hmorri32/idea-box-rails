require 'rails_helper'

RSpec.describe IdeaImage, type: :model do
  describe "relationships" do
    it { should belong_to(:image) }
    it { should belong_to(:idea) }
  end
end