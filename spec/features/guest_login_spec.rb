require 'rails_helper'

describe "A user can create an account" do
  scenario 'user sees link to create account' do
    visit '/'
    click_on "Create Account"
  end
end