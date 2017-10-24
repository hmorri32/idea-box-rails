require 'rails_helper'

RSpec.describe User, :type => :model do
  describe "validations" do
    it { should validate_presence_of(:username) }
    it { should validate_uniqueness_of(:username) }
  end

  describe "User roles" do
    it "user can be created as a default user" do
      user = User.create(username: 'cool guy', password: 'django', role: 0)

      expect(user).to be_valid
      expect(user.role).to eq("default")
      expect(user.default?).to be_truthy
    end

    it 'user can be created as an admin' do
      user = User.create(username: 'dude', password: 'whatup',role: 1)

      expect(user).to be_valid
      expect(user.role).to eq("admin")
      expect(user.admin?).to be_truthy
    end

    it 'user is defaulted to default user' do
      user = User.create(username: 'dude', password: 'whatup')

      expect(user).to be_valid
      expect(user.role).to eq("default")
      expect(user.default?).to be_truthy
    end

    it 'a user can be converted from default to admin' do
      user = User.create(username: 'dude', password: 'whatup')

      expect(user).to be_valid
      expect(user.role).to eq("default")
      expect(user.default?).to be_truthy

      user.admin!
      expect(user.role).to eq('admin')
    end
  end
end