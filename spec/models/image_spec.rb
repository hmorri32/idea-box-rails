require 'rails_helper'

RSpec.describe Image, :type => :model do
  describe 'validations' do
    # it { should validate_presence_of(:url) }
  end

  describe 'relationships' do
    it { should have_many(:ideas).through(:idea_images) }
  end
end

