require 'rails_helper'

RSpec.feature "when i visit admin categories index" do
  context 'as an admin' do
    it 'I see a list of all categories' do
      admin_user = User.create(username: 'admin',
                               password: 'pass',
                               role: 1)

      allow_any_instance_of(ApplicationController)
        .to receive(:current_user)
        .and_return(admin_user)

      visit admin_categories_path

      expect(page).to have_content("Admin Categories")
    end
  end

  context "as a default user" do
    it 'I receive status 404 and see an error page' do
      default_user = User.create(username: 'default', password: 'whatever')
      allow_any_instance_of(ApplicationController)
        .to receive(:current_user)
        .and_return(default_user)

      visit admin_categories_path

      expect(page.status_code).to eq(404)
      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end
end