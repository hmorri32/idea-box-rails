require 'rails_helper'

describe "user actions" do
  scenario 'user sees link to create account' do
    visit '/'
    click_on "Create Account"

    expect(current_path).to eq(new_user_path)

    fill_in "user[username]", with: 'Django'
    fill_in "user[password]",  with: 'd is silent, hillbilly'
    click_on "Create User"

    expect(page).to have_content("Welcome, Django")
    expect(page).to have_link("Log Out")
  end

  scenario "a registered user can log in" do
    visit '/'

    within('.welcome-partial') do
      click_on "Log In"
    end

    expect(current_path).to eq(login_path)
    user = User.create(username: 'Django', password: 'cool')

    fill_in "session[username]", with: user.username
    fill_in "session[password]", with: user.password

    within('.form-container') do
      click_on "Log In"
    end

    expect(current_path).to eq(user_path(user))
    expect(page).to have_content("Welcome, Django")
  end

  scenario 'a logged in user can log out' do
    visit '/'

    within('.welcome-partial') do
      click_on "Log In"
    end

    expect(current_path).to eq(login_path)

    user = User.create(username: 'Django', password: 'cool')

    fill_in "session[username]", with: user.username
    fill_in "session[password]", with: user.password

    within('.form-container') do
      click_on "Log In"
    end

    expect(current_path).to eq(user_path(user))
    expect(page).to have_content("Welcome, Django")
    expect(page).to have_link("Log Out")

    click_on "Log Out"
    expect(current_path).to eq(root_path)
  end
end