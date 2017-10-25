require 'rails_helper'

RSpec.feature "creating and deleting categories" do
  context 'as an admin' do

    before do
      admin_user = User.create(username: 'admin', password: 'pass', role: 1)

      allow_any_instance_of(ApplicationController)
        .to receive(:current_user)
        .and_return(admin_user)
    end

    it "I see a new category form" do
      visit new_admin_category_path

      expect(current_path).to eq(new_admin_category_path)
      expect(page).to have_content("Create A New Category")
      expect(page).to have_button("Create Category")
    end

    it "I am able to create a new category" do
      visit new_admin_category_path

      fill_in "category[title]", with: 'Django'
      click_on 'Create Category'

      expect(current_path).to eq(admin_categories_path)
      expect(page).to have_content("Django")
    end

    it "I am able to delete a category" do
      category = Category.create(title: 'sweet category')

      visit admin_categories_path

      expect(page).to have_content("sweet category")

      click_on "Delete"

      expect(page).to_not have_content("sweet category")
    end
  end

  context "as a default user" do
    it "I receive status 404 and see an error page" do
      default_user = User.create(username: 'default', password: 'whatever')

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(default_user)

      visit new_admin_category_path
      expect(page.status_code).to eq(404)
      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end
end